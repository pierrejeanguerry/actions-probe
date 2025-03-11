<script lang="ts">
	import Fa from 'svelte-fa';
	import Aggregation from '../../components/lab/aggregation.svelte';
	import Boids from '../../components/lab/boids.svelte';
	import Cell from '../../components/lab/cell.svelte';
	import { faAngleDown, faAngleUp } from '@fortawesome/free-solid-svg-icons';

	let labList = [
		{ component: Cell, title: 'Automate Cellulaire', show: false },
		{ component: Aggregation, title: 'Agregation limitee par diffusion', show: false },
		{ component: Boids, title: 'Boids', show: false }
	];

	function toggleSection(index: number) {
		labList[index].show = !labList[index].show;
	}
</script>

<div>
	<h2 class="title">Lab</h2>
	<p>
		Bienvenue dans mon lab, un espace où je présente mes expérimentations et idées en cours, que je
		veux partager pour le plaisir.
	</p>
	<div class="list">
		{#each labList as { component, title, show }, index}
			<div class="bg">
				<button class="section-button" on:click={() => toggleSection(index)}>
					<h3 class="section-title">{title}</h3>
					{#if show}
						<Fa icon={faAngleUp} />
					{:else}
						<Fa icon={faAngleDown} />
					{/if}
				</button>
				{#if show}
					<svelte:component this={component} />
				{/if}
			</div>
		{/each}
	</div>
</div>

<style>
	p {
		color: var(--text-secondary-color);
		font-weight: 500;
		font-size: large;
		font-style: normal;
		font-family: var(--primary-font);
		padding-bottom: 1rem;
	}
	.section-button {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: x-large;
		background-color: #0c1320;
		border: 1px solid #000;
		padding-left: 0.5rem;
		padding-right: 0.5rem;
	}

	.section-title {
		cursor: pointer;
		font-size: 1.5rem;
		font-weight: bold;
		color: var(--text-primary-color);
		margin: 10px 0;
	}

	.list {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}
</style>
