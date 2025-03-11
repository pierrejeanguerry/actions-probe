<script lang="ts">
	import { faPause, faPlay } from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';

	let canvas: HTMLCanvasElement;
	let width = 0;
	let height = 0;
	let nbRow = 40;
	let nbCol = 40;
	let cellH = 0;
	let cellW = 0;
	let nbRayonMax = 300;
	let currentCycle = 0;

	$: {
		updateDimensions();
	}

	function updateDimensions() {
		if (window.innerWidth > 1300) {
			width = (window.innerWidth * 58) / 100;
			height = (window.innerHeight * 70) / 100;
		} else {
			width = (window.innerWidth * 90) / 100;
			height = (window.innerHeight * 90) / 100;
		}
	}

	function updateCellDim() {
		cellH = height / nbRow;
		cellW = width / nbCol;
	}

	type Cell = { value: number };
	type Map = Cell[][];
	type History = Map[];

	let history: History;

	function generateEmptyMap(): Map {
		return Array.from({ length: nbRow }, () => Array.from({ length: nbCol }, () => ({ value: 0 })));
	}

	function drawEmptyCell(x: number, y: number) {
		let ctx = canvas.getContext('2d');
		if (!ctx) return;

		ctx.fillStyle = '#888';
		ctx.fillRect(x, y, cellW, cellH);
	}

	function drawFullCell(x: number, y: number) {
		let ctx = canvas.getContext('2d');
		if (!ctx) return;

		ctx.fillStyle = '#fff';
		ctx.fillRect(x, y, cellW, cellH);
	}

	function drawMap(map: Map) {
		let ctx = canvas.getContext('2d');
		if (!ctx) return;

		ctx.clearRect(0, 0, width, height);
		let countH = 0;
		map.forEach((row) => {
			let countW = 0;
			row.forEach((elem) => {
				if (elem.value === 1) drawEmptyCell(countW, countH);
				if (elem.value === 2) drawFullCell(countW, countH);
				countW += cellW;
			});
			countH += cellH;
		});
	}

	function copyMap(mapNumber: number) {
		history[mapNumber - 1].forEach((row, rowIndex) => {
			row.forEach((cell, colIndex) => {
				if (cell.value === 1) history[mapNumber][rowIndex][colIndex].value = cell.value;
			});
		});
	}

	function polishMap() {
		copyMap(nbRayonMax);

		for (let row = 1; row < nbRow - 1; row++) {
			for (let col = 1; col < nbCol - 1; col++) {
				let count = 0;
				if (history[nbRayonMax - 1][row][col].value !== 1) {
					if (history[nbRayonMax - 1][row - 1][col].value === 1) count++;
					if (history[nbRayonMax - 1][row][col - 1].value === 1) count++;
					if (history[nbRayonMax - 1][row][col + 1].value === 1) count++;
					if (history[nbRayonMax - 1][row + 1][col].value === 1) count++;
					if (count >= 2) history[nbRayonMax][row][col].value = 1;
					if (count <= 1) history[nbRayonMax][row][col].value = 0;
				}
			}
		}
		copyMap(nbRayonMax + 1);

		for (let row = 1; row < nbRow - 1; row++) {
			for (let col = 1; col < nbCol - 1; col++) {
				let count = 0;
				if (history[nbRayonMax - 1][row][col].value !== 1) {
					if (history[nbRayonMax][row - 1][col].value === 1) count++;
					if (history[nbRayonMax][row][col - 1].value === 1) count++;
					if (history[nbRayonMax][row][col + 1].value === 1) count++;
					if (history[nbRayonMax][row + 1][col].value === 1) count++;
					if (count > 0) history[nbRayonMax + 1][row][col].value = 2;
				}
			}
		}
	}

	function generateAggregation(begin_x: number, begin_y: number) {
		for (let count = 1; count < nbRayonMax; count++) {
			copyMap(count);
			let x: number = Math.floor(Math.random() * (nbRow - 2) + 1);
			let y: number = Math.floor(Math.random() * (nbCol - 2) + 1);

			while (
				history[count][x][y - 1].value !== 1 &&
				history[count][x][y + 1].value !== 1 &&
				history[count][x - 1][y].value !== 1 &&
				history[count][x + 1][y].value !== 1 &&
				history[count][x - 1][y - 1].value !== 1 &&
				history[count][x + 1][y - 1].value !== 1 &&
				history[count][x - 1][y + 1].value !== 1 &&
				history[count][x + 1][y + 1].value !== 1
			) {
				let conditions = [
					() => {
						if (x < begin_x) x++;
					},
					() => {
						if (y < begin_y) y++;
					},
					() => {
						if (x > begin_x) x--;
					},
					() => {
						if (y > begin_y) y--;
					}
				];
				conditions = conditions.sort(() => Math.random() - 0.5);

				conditions.forEach((cond) => cond());
			}
			history[count][x][y].value = 1;
		}
	}

	function start() {
		updateCellDim();
		currentCycle = 0;
		history = Array.from({ length: nbRayonMax + 2 }, () => generateEmptyMap());
		let begin_x: number = Math.floor(Math.random() * (nbRow - 1) + 1);
		let begin_y: number = Math.floor(Math.random() * (nbCol - 1) + 1);
		history[0][begin_x][begin_y].value = 1;
		generateAggregation(begin_x, begin_y);
		polishMap();
		drawMap(history[0]);
	}

	let intervalId: number | null = null;

	function play() {
		if (!history) start();
		if (intervalId) return;
		intervalId = setInterval(() => {
			if (currentCycle <= nbRayonMax) {
				currentCycle++;
				drawMap(history[currentCycle]);
			} else {
				stop();
			}
		}, 10);
	}

	function stop() {
		if (intervalId) {
			clearInterval(intervalId);
			intervalId = null;
		}
	}

	// function handleNextCycle() {
	// 	if (currentCycle < nbRayonMax) {
	// 		currentCycle += 1;
	// 		drawMap(history[currentCycle]);
	// 	}
	// }

	// function handlePrevCycle() {
	// 	if (currentCycle > 0) {
	// 		currentCycle -= 1;
	// 		drawMap(history[currentCycle]);
	// 	}
	// }
</script>

<div class="container-lab">
	<div class="display-lab">
		<div class="controls-lab">
			<div class="commands-lab">
				<button class="button-lab" on:click={play}><Fa icon={faPlay} /></button>
				<button class="button-lab" on:click={stop}><Fa icon={faPause} /></button>
			</div>
			<span>Particules: </span><span>{currentCycle}</span>
			<!-- <div class="commands-lab">
			<button class="button-lab" on:click={handlePrevCycle}><Fa icon={faBackward} /></button>
			<button class="button-lab" on:click={handleNextCycle}><Fa icon={faForward} /></button>
		</div> -->
			<label class="label-lab">
				<span>Nombre de lignes</span>
				<input type="range" min="20" max="100" step="10" bind:value={nbRow} />
				<span>{nbRow}</span>
			</label>
			<label class="label-lab">
				<span>Nombre de colonnes</span>
				<input type="range" min="20" max="100" step="10" bind:value={nbCol} />
				<span>{nbCol}</span>
			</label>
			<label class="label-lab">
				<span>Nombre de particules</span>
				<input type="range" min="50" max="1000" step="10" bind:value={nbRayonMax} />
				<span>{nbRayonMax}</span>
			</label>
			<button class="button-lab reset-lab" on:click={start}>Generer un nouveau</button>
		</div>
		<div>
			<canvas id="canvas-lab" bind:this={canvas} {width} {height} />
		</div>
	</div>
	<div>
		<h3 class="subtitle-lab">Description</h3>
		<p class="p-lab">
			La génération procédurale DLA (Diffusion Limited Aggregation) est une méthode utilisée pour
			créer des structures complexes de manière autonome, souvent utilisée dans la modélisation de
			phénomènes naturels, comme la formation de cristaux ou la croissance de structures fractales.
			Le principe de DLA repose sur l'agrégation de particules qui, après avoir été lancées au
			hasard, se déplacent jusqu'à ce qu'elles rencontrent une structure existante. Lorsqu'elles
			entrent en contact avec un autre agrégat, elles s'y fixent, ce qui forme progressivement une
			structure en forme de fractale. Ce processus simule des phénomènes de croissance ou de
			diffusion dans des systèmes physiques.
		</p>

		<p class="p-lab" style="font-style: italic;">
			Ce projet découle d'un précédent réalisé en C, où l'objectif était de générer des cartes
			procédurales à l'aide de différents algorithmes. A la fin du processus, il y a une phase de
			"polish" durant laquelle j'ajoute ou enleve des particule en fonction de condition. Enfin,
			j'ajoute des particules qui délimite ce qui est une particule de ce qui n'en est pas.
		</p>
	</div>
</div>
