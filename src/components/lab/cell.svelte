<script lang="ts">
	import { faBackward, faForward, faPause, faPlay } from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';

	let canvas: HTMLCanvasElement;
	let width = 0;
	let height = 0;
	let nbRow = 20;
	let nbCol = 20;
	let cellH = 0;
	let cellW = 0;
	let cycleMax = 10;
	let currentCycle = 0;
	let concentration = 0.5;
	let cycleDuration = 400;

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

	function generateRandomMap() {
		history[0] = Array.from({ length: nbRow }, () =>
			Array.from({ length: nbCol }, () => ({ value: Math.random() < concentration ? 1 : 0 }))
		);
	}

	function drawCell(x: number, y: number) {
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
				if (elem.value === 1) drawCell(countW, countH);
				countW += cellW;
			});
			countH += cellH;
		});
	}

	function getNextCycle(newCycle: number) {
		history[newCycle].forEach((row, rowIndex) => {
			row.forEach((elem, colIndex) => {
				let count = 0;

				if (
					rowIndex > 0 &&
					colIndex > 0 &&
					history[newCycle - 1][rowIndex - 1][colIndex - 1].value === 1
				)
					count++;
				if (rowIndex > 0 && history[newCycle - 1][rowIndex - 1][colIndex].value === 1) count++;
				if (
					rowIndex > 0 &&
					colIndex < nbCol - 1 &&
					history[newCycle - 1][rowIndex - 1][colIndex + 1].value === 1
				)
					count++;
				if (colIndex > 0 && history[newCycle - 1][rowIndex][colIndex - 1].value === 1) count++;
				if (history[newCycle - 1][rowIndex][colIndex].value === 1) count++;
				if (colIndex < nbCol - 1 && history[newCycle - 1][rowIndex][colIndex + 1].value === 1)
					count++;
				if (
					rowIndex < nbRow - 1 &&
					colIndex > 0 &&
					history[newCycle - 1][rowIndex + 1][colIndex - 1].value === 1
				)
					count++;
				if (rowIndex < nbRow - 1 && history[newCycle - 1][rowIndex + 1][colIndex].value === 1)
					count++;
				if (
					rowIndex < nbRow - 1 &&
					colIndex < nbCol - 1 &&
					history[newCycle - 1][rowIndex + 1][colIndex + 1].value === 1
				)
					count++;

				if (count <= 4) {
					elem.value = 0;
				} else {
					elem.value = 1;
				}
			});
		});
	}

	function handleNextCycle() {
		if (currentCycle < cycleMax) {
			currentCycle++;
			drawMap(history[currentCycle]);
		}
	}

	function handlePrevCycle() {
		if (currentCycle > 0) {
			currentCycle--;
			drawMap(history[currentCycle]);
		}
	}

	function start() {
		updateCellDim();
		currentCycle = 0;
		history = Array.from({ length: cycleMax + 1 }, () => generateEmptyMap());
		generateRandomMap();
		drawMap(history[0]);
		let cycle = 1;
		while (cycle <= cycleMax) {
			getNextCycle(cycle);
			cycle++;
		}
	}

	let intervalId: number | null = null;

	function play() {
		if (!history) start();
		if (intervalId) return; // Si un interval est déjà en cours, on ne fait rien.
		currentCycle = 0;
		intervalId = setInterval(() => {
			if (currentCycle < cycleMax) {
				currentCycle++;
				drawMap(history[currentCycle]);
			} else {
				stop();
			}
		}, cycleDuration);
	}

	function stop() {
		if (intervalId) {
			clearInterval(intervalId); // Annuler l'intervalle en cours
			intervalId = null;
		}
	}
</script>

<div class="container-lab">
	<div class="display-lab">
		<div class="controls-lab">
			<div class="commands-lab">
				<button class="button-lab" on:click={play}><Fa icon={faPlay} /></button>
				<button class="button-lab" on:click={stop}><Fa icon={faPause} /></button>
			</div>
			<div class="commands-lab">
				<button class="button-lab" on:click={handlePrevCycle}><Fa icon={faBackward} /></button>
				<span>Cycle:</span><span> {currentCycle}</span>
				<button class="button-lab" on:click={handleNextCycle}><Fa icon={faForward} /></button>
			</div>
			<label class="label-lab">
				<span>Nombre de lignes</span>
				<input type="range" min="20" max="200" step="10" bind:value={nbRow} />
				<span>{nbRow}</span>
			</label>
			<label class="label-lab">
				<span>Nombre de colonnes</span>
				<input type="range" min="20" max="200" step="10" bind:value={nbCol} />
				<span>{nbCol}</span>
			</label>
			<label class="label-lab">
				<span>Concentration</span>
				<input type="range" min="0.4" max="0.6" step="0.01" bind:value={concentration} />
				<span>{concentration}</span>
			</label>
			<label class="label-lab">
				<span>Nombre de cycles</span>
				<input type="range" min="5" max="40" step="5" bind:value={cycleMax} />
				<span>{cycleMax}</span>
			</label>
			<label class="label-lab">
				<span>Vitesse des cycles</span>
				<input type="range" min="50" max="500" step="10" bind:value={cycleDuration} />
				<span>{cycleDuration}</span>
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
			Un automate cellulaire est un modèle mathématique constitué d'une grille de cellules où chaque
			cellule peut prendre un état parmi un ensemble fini. L'évolution des états se fait selon des
			règles prédéfinies qui dépendent de l'état actuel de la cellule et de celui de ses voisines.
			Ce modèle est souvent utilisé pour simuler des phénomènes complexes comme la croissance des
			cristaux, la propagation des incendies ou les systèmes biologiques.
		</p>
		<p class="p-lab">Dans ce modèle :</p>
		<p class="p-lab">
			Une cellule est ou reste vivante si elle est entourée d'au moins 5 cellules vivantes.
		</p>
		<p class="p-lab">
			Une cellule est ou reste morte si elle est entourée de 4 cellules vivantes ou moins.
		</p>

		<p class="p-lab" style="font-style: italic;">
			Ce projet découle d'un précédent réalisé en C, où l'objectif était de générer des cartes
			procédurales à l'aide de différents algorithmes. Les règles de cet automate visent à créer des
			zones qui pourraient faire penser aux boyaux d'un caverne vu du dessus.
		</p>
	</div>
</div>
