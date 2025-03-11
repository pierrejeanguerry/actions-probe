<script lang="ts">
	import { onMount } from 'svelte';
	import { fly } from 'svelte/transition';
	import { quintIn, quintOut } from 'svelte/easing';
	import { showComponent } from './event';
	import { page } from '$app/stores';
	let path: string;
	let mini: boolean = false;

	$: {
		path = $page.url.pathname;
		mini = path !== '/';
	}

	let showComp: boolean;
	showComponent.subscribe((value) => {
		showComp = value;
	});

	onMount(() => {
		showComponent.set(true);
	});
</script>

<div class={mini ? 'contain_mini' : 'contain'} id="to-scroll">
	{#if showComp}
		<div
			transition:fly={{ delay: 300, duration: 500, x: -200, y: 0, opacity: 0, easing: quintOut }}
		>
			<div
				transition:fly={{ delay: 0, duration: 300, x: -200, y: 0, opacity: 0, easing: quintIn }}
				id="content"
			>
				<slot />
			</div>
		</div>
	{/if}
</div>

<style>
	.contain,
	.contain_mini {
		clip-path: padding-box;
		background-color: var(--bg-primary-color);
		background-color: var(--bg-primary-color);
		height: 85vh;
		padding: 3.125rem;
		color: var(--text-primary-color);
		overflow-y: scroll;
		overflow-x: hidden;
		transition: all, 350ms;
		margin-top: 2.5rem;
		margin-bottom: 2.5rem;
		margin-right: 2.5rem;
	}

	.contain {
		width: 60vw;
		position: relative;
		border-start-end-radius: 2.5rem;
		border-end-end-radius: 2.5rem;
	}
	.contain_mini {
		width: 83vw;
		border-radius: 2.5rem;
		position: absolute;
		right: 0;
	}

	@media screen and (max-width: 1300px) {
		.contain,
		.contain_mini {
			border-radius: 2.5rem;
			position: relative;
			height: fit-content;
			width: 95%;
			display: block;
			align-self: center;
			padding: 1rem;
			margin: 0.8rem;
		}
	}
</style>
