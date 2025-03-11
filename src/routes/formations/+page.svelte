<script lang="ts">
	import Circle from '../../components/circle.svelte';
	import formations from './formations.json';
	let hoveredIndex = -1;
</script>

<h2 class="title">Mes formations</h2>
{#each formations as formation, i}
	<div
		class="contain"
		role="button"
		aria-expanded={hoveredIndex === i ? 'true' : 'false'}
		on:mouseenter={() => (hoveredIndex = i)}
		on:mouseleave={() => (hoveredIndex = -1)}
		tabindex="0"
	>
		<Circle animate={hoveredIndex === i} />
		<div>
			<h3>{formation.titre}</h3>
			<p>{formation['sous-titre']}</p>
			<p>{formation.description}</p>
		</div>
	</div>
	<br />
{/each}

<style>
	.contain {
		margin-top: 2rem;
		display: flex;
		flex-direction: row;
		align-items: flex-start;
	}
	div div {
		display: flex;
		flex-direction: column;
		margin-left: 10px;
	}

	h3 {
		font-weight: 400;
		font-size: 40px;
		font-style: normal;
		font-family: var(--primary-font);
	}
	p {
		color: var(--text-secondary-color);
		font-weight: 500;
		font-size: large;
		font-style: normal;
		font-family: var(--primary-font);
	}

	@media screen and (max-width: 1600px) {
		h3 {
			font-weight: 400;
			font-size: 30px;
			font-style: normal;
			font-family: var(--primary-font);
		}
		p {
			color: var(--text-secondary-color);
			font-weight: 500;
			font-size: large;
			font-style: normal;
			font-family: var(--primary-font);
		}
	}
</style>
