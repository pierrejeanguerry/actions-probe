<script lang="ts">
	import { faPause, faPlay } from '@fortawesome/free-solid-svg-icons';
	import { onMount } from 'svelte';
	import Fa from 'svelte-fa';

	let width = 0;
	let height = 0;
	let play = false;

	$: updateDimensions();

	let canvas: HTMLCanvasElement;
	const turnFactor = 5;
	let mouseX = -1;
	let mouseY = -1;

	const settings = {
		maxBoids: 400,
		boidCount: 100,
		visualRange: 50,
		protectedRange: 25,
		centeringFactor: 0.005,
		avoidFactor: 0.05,
		matchingFactor: 0.05,
		minSpeed: 1,
		maxSpeed: 3
	};
	type Boid = {
		x: number;
		y: number;
		vx: number;
		vy: number;
	};

	let boids: Boid[] = createBoids(settings.maxBoids);

	let protectedRangeSquared = settings.protectedRange ** 2;
	let visualRangeSquared = settings.visualRange ** 2;

	function updateDimensions() {
		if (window.innerWidth > 1300) {
			width = (window.innerWidth * 58) / 100;
			height = (window.innerHeight * 70) / 100;
		} else {
			width = (window.innerWidth * 90) / 100;
			height = (window.innerHeight * 90) / 100;
		}
	}

	function createBoids(count: number) {
		return Array.from({ length: count }, () => ({
			x: Math.random() * width,
			y: Math.random() * height,
			vx: (Math.random() - 0.5) * 2,
			vy: (Math.random() - 0.5) * 2
		}));
	}

	function limitSpeed(boid: Boid) {
		let speed = Math.sqrt(boid.vx ** 2 + boid.vy ** 2);
		if (speed < settings.minSpeed) {
			boid.vx = (boid.vx / speed) * settings.minSpeed;
			boid.vy = (boid.vy / speed) * settings.minSpeed;
		}
		if (speed > settings.maxSpeed) {
			boid.vx = (boid.vx / speed) * settings.maxSpeed;
			boid.vy = (boid.vy / speed) * settings.maxSpeed;
		}
	}

	function updateBoidPosition(boid: Boid) {
		boid.x += boid.vx;
		boid.y += boid.vy;

		if (boid.x < 0) boid.vx += turnFactor;
		if (boid.x > width) boid.vx -= turnFactor;
		if (boid.y < 0) boid.vy += turnFactor;
		if (boid.y > height) boid.vy -= turnFactor;
	}

	function handleMouseInfluence(boid: Boid) {
		if (mouseX >= 0 && mouseY >= 0) {
			boid.vx += (mouseX - boid.x) * 0.01;
			boid.vy += (mouseY - boid.y) * 0.01;
		}
	}

	function updateBoids() {
		let ctx = canvas.getContext('2d');
		if (!ctx) return;

		ctx.clearRect(0, 0, width, height);

		for (let boid of boids.slice(0, settings.boidCount)) {
			let close_dx = 0,
				close_dy = 0;
			let xpos_avg = 0,
				ypos_avg = 0,
				xvel_avg = 0,
				yvel_avg = 0;
			let neighboring_boids = 0;

			for (let otherBoid of boids.slice(0, settings.boidCount)) {
				if (boid === otherBoid) continue;

				let dx = boid.x - otherBoid.x;
				let dy = boid.y - otherBoid.y;
				let squared_distance = dx ** 2 + dy ** 2;

				if (Math.abs(dx) < settings.visualRange && Math.abs(dy) < settings.visualRange) {
					if (squared_distance < protectedRangeSquared) {
						close_dx += dx;
						close_dy += dy;
					} else if (squared_distance < visualRangeSquared) {
						xpos_avg += otherBoid.x;
						ypos_avg += otherBoid.y;
						xvel_avg += otherBoid.vx;
						yvel_avg += otherBoid.vy;
						neighboring_boids++;
					}
				}
			}

			if (neighboring_boids > 0) {
				xpos_avg /= neighboring_boids;
				ypos_avg /= neighboring_boids;
				xvel_avg /= neighboring_boids;
				yvel_avg /= neighboring_boids;

				boid.vx +=
					(xpos_avg - boid.x) * settings.centeringFactor +
					(xvel_avg - boid.vx) * settings.matchingFactor;
				boid.vy +=
					(ypos_avg - boid.y) * settings.centeringFactor +
					(yvel_avg - boid.vy) * settings.matchingFactor;
			}

			boid.vx += close_dx * settings.avoidFactor;
			boid.vy += close_dy * settings.avoidFactor;

			limitSpeed(boid);
			updateBoidPosition(boid);
			handleMouseInfluence(boid);

			ctx.beginPath();
			ctx.arc(boid.x, boid.y, 5, 0, Math.PI * 2);
			ctx.fillStyle = '#fff';
			ctx.fill();
			ctx.closePath();
		}
	}

	function handleMouseMove(event: MouseEvent) {
		const rect = canvas.getBoundingClientRect();
		mouseX = event.clientX - rect.left;
		mouseY = event.clientY - rect.top;
	}

	function handleMouseLeave() {
		mouseX = -1;
		mouseY = -1;
	}

	function animate() {
		if (!play) return;
		updateBoids();
		requestAnimationFrame(animate);
	}
	onMount(() => {});

	function handlePlay() {
		if (play) return;
		play = true;
		animate();
	}
	function handlePause() {
		if (!play) return;
		play = false;
	}
</script>

<div class="container-lab">
	<div class="display-lab">
		<div class="controls-lab">
			<div class="commands-lab">
				<button class="button-lab" on:click={() => handlePlay()}><Fa icon={faPlay} /></button>
				<button class="button-lab" on:click={() => handlePause()}><Fa icon={faPause} /></button>
			</div>
			<label class="label-lab">
				<span>Nombre d'elements</span>
				<input
					type="range"
					min="0"
					max={settings.maxBoids}
					step="10"
					bind:value={settings.boidCount}
				/>
				<span>{settings.boidCount}</span>
			</label>
			<label class="label-lab">
				<span>Portée visuelle</span>
				<input
					type="range"
					min="20"
					max="200"
					bind:value={settings.visualRange}
					on:input={() => (visualRangeSquared = settings.visualRange * settings.visualRange)}
				/>
				<span>{settings.visualRange}</span>
			</label>
			<label class="label-lab">
				<span>Portée protégée</span>
				<input
					type="range"
					min="10"
					max="50"
					bind:value={settings.protectedRange}
					on:input={() =>
						(protectedRangeSquared = settings.protectedRange * settings.protectedRange)}
				/>
				<span>{settings.protectedRange}</span>
			</label>
			<label class="label-lab">
				<span>Evitement</span>
				<input type="range" min="0.01" max="0.1" step="0.01" bind:value={settings.avoidFactor} />
				<span>{settings.avoidFactor.toFixed(2)}</span>
			</label>
			<label class="label-lab">
				<span>Alignement</span>
				<input type="range" min="0.01" max="0.1" step="0.01" bind:value={settings.matchingFactor} />
				<span>{settings.matchingFactor.toFixed(2)}</span>
			</label>
			<label class="label-lab">
				<span>Vitesse minimale</span>
				<input type="range" min="0.5" max="10" step="0.1" bind:value={settings.minSpeed} />
				<span>{settings.minSpeed.toFixed(1)}</span>
			</label>
			<label class="label-lab">
				<span>Vitesse maximale</span>
				<input type="range" min="0.5" max="10" step="0.5" bind:value={settings.maxSpeed} />
				<span>{settings.maxSpeed.toFixed(1)}</span>
			</label>
		</div>
		<div>
			<canvas
				id="canvas-lab"
				bind:this={canvas}
				{width}
				{height}
				on:mousemove={handleMouseMove}
				on:mouseleave={handleMouseLeave}
			/>
		</div>
	</div>
	<div>
		<h3 class="subtitle-lab">Description</h3>
		<p class="p-lab">
			Les boids constituent un modèle informatique simulant le comportement collectif d’essaims,
			tels que les volées d’oiseaux ou les bancs de poissons. Chaque boid (entité individuelle) suit
			trois règles simples : séparation (éviter les collisions avec ses voisins), alignement
			(s’orienter dans la même direction que ses voisins) et cohésion (se rapprocher du groupe). Ce
			modèle illustre comment des comportements complexes peuvent émerger à partir de règles locales
			simples.
		</p>
		<p class="p-lab" style="font-style: italic;">
			En l'occurence dans cette version j'ai ajouté une Interpolation linéaire dans la direction du
			curseur lorsque celui-ci survole le canva pour ajouter un peu d'interactivité et de ludisme.
		</p>
	</div>
</div>
