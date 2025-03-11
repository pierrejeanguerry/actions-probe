<script lang="ts">
	import type { IconDefinition } from '@fortawesome/free-solid-svg-icons';
	import { onMount } from 'svelte';
	import Fa from 'svelte-fa';

	export let image: IconDefinition | null = null;
	export let description: string;
	export let path: string | null = null;
	export let alt: string | null = null;
	export let style: string | null = null;
	export let hoverStyle: string | null = null;

	let hoverClass: string = '';

	onMount(() => {
		if (hoverStyle) {
			hoverClass = `hover-custom-${Math.random().toString(36).substring(2, 15)}`;
			document.styleSheets[0].insertRule(
				`
                .${hoverClass} {
                    ${style}
	            }
			`,
				0
			);
			document.styleSheets[0].insertRule(
				`
				.icon:hover .${hoverClass}{
					${hoverStyle}
				}
			`,
				0
			);
		}
	});
</script>

<div class="skill">
	<div class="icon">
		{#if path !== null}
			<img src={path} {alt} class={hoverClass} />
		{:else if image !== null}
			<Fa icon={image} />
		{/if}
	</div>
	<p class="description">{description}</p>
</div>

<style>
	.icon {
		padding: 0, 10px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		border-radius: 75px;
		height: 10rem;
		width: 6rem;
		border: 2px solid white;
		transition: all 400ms;
		z-index: 10;
		background-color: #09101a;
	}

	.icon:hover {
		border-color: #55e6a5;
		color: #55e6a5;
		transform: translateY(-30px);
	}

	.skill {
		display: flex;
		flex-direction: column;
		align-items: center;
		position: relative;
	}

	.description {
		border-radius: 0px 0px 50px 50px;
		padding-top: 30px;
		padding-bottom: 20px;

		z-index: 0;
		transform: translateY(50px);
		transition: all, 600ms;
		font-size: medium;
		width: 5.5rem;
		background-color: white;
		color: black;
		text-align: center;
		position: absolute;
	}

	.icon:hover + .description {
		transform: translateY(100px);
	}

	.icon img {
		height: 1em;
		transition: all, 250ms;
	}
</style>
