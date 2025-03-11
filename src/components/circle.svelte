<script lang="ts">
	import { afterUpdate, onMount } from 'svelte';
	let circle: HTMLCanvasElement;
	let step = 0;
	const maxStepCircles = 100;
	const maxStep = 100;
	let currentStep = 0;
	export let animate = false;
	let isCirclesFinished = false;
	const delay = 800;

	function startCirclesWithDelay() {
		setTimeout(() => {
			circles(step).then(() => {
				if (animate) animation();
			});
		}, delay);
	}

	function circles(step: number): Promise<void> {
		return new Promise((resolve) => {
			let ctx = circle.getContext('2d');
			if (!ctx) return;

			ctx.clearRect(0, 0, circle.width, circle.height);

			ctx.beginPath();
			ctx.arc(12, 12, Math.min((step / maxStepCircles) * 11, 11), 0, Math.PI * 2, true);
			ctx.strokeStyle = '#FFFFFF';
			ctx.stroke();

			let region = new Path2D();
			region.arc(12, 12, Math.min((step / maxStepCircles) * 7, 7), 0, Math.PI * 2, true);
			region.closePath();
			ctx.fillStyle = '#55e6a5';
			ctx.fill(region);

			if (step < maxStepCircles) {
				step++;
				requestAnimationFrame(() => circles(step).then(resolve));
			} else {
				isCirclesFinished = true;
				resolve();
			}
		});
	}
	function animation() {
		let ctx = circle.getContext('2d');
		if (!ctx) return;

		ctx.clearRect(0, 0, circle.width, circle.height);
		ctx.beginPath();

		ctx.arc(12, 12, 11, 0, Math.PI * 2, true);
		ctx.strokeStyle = '#FFFFFF';
		ctx.stroke();

		ctx.moveTo(12, 23);
		ctx.lineTo(12, 67 * (currentStep / maxStep) + 23);
		ctx.stroke();

		let region = new Path2D();
		region.arc(12, 12, 7 - 5 * (currentStep / maxStep), 0, Math.PI * 2, true);
		region.closePath();
		ctx.fillStyle = '#55e6a5';
		ctx.fill(region);
		if ((animate && currentStep < maxStep) || (!animate && currentStep > 0)) {
			currentStep += animate ? 1 : -1;
			requestAnimationFrame(() => animation());
		}
	}

	onMount(() => {
		startCirclesWithDelay();
	});

	afterUpdate(() => {
		if (isCirclesFinished) animation();
	});
</script>

<canvas bind:this={circle} width="24px" height="100px" />

<style>
	canvas {
		margin-top: 17px;
		transition: all 0.3s ease;
	}
</style>
