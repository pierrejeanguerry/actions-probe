<script lang="ts">
	import '../app.css';
	import BurgerMenu from '../components/burgerMenu.svelte';
	import Card from '../components/card.svelte';
	import Content from '../components/content.svelte';
	import Modal from '../components/modal.svelte';
	import Navbar from '../components/navbar.svelte';
	import { page } from '$app/stores';
	import { showComponent } from '../components/event';
	import { goto } from '$app/navigation';
	import '../app.css';

	let path: string;
	let mini: boolean = false;

	$: {
		path = $page.url.pathname;
		mini = path !== '/';
	}

	function changePage(path: string) {
		if (path != $page.url.pathname) {
			showComponent.set(false);
			goto(path);
			setTimeout(() => {
				showComponent.set(true);
			}, 1000);
		}
	}
</script>

<div id="layout">
	<BurgerMenu />
	<Modal />
	<div>
		<section class={mini ? 'side_mini' : 'side'}>
			<Navbar />
			<Card />
		</section>
		<Content>
			<slot />
		</Content>
		<button class="mention" on:click={() => changePage('/mentions-legales#to-scroll')}>
			Mentions légales</button
		>
	</div>
</div>

<style>
	#layout {
		overflow-x: hidden;
	}
	div {
		display: flex;
		justify-content: center;
	}

	.side {
		display: flex;
		justify-content: center;
	}
	.side_mini {
		display: flex;
		position: absolute;
		top: 0;
		left: 0;
		justify-content: center;
	}

	.mention {
		position: absolute;
		color: var(--text-primary-color);
		bottom: 2rem;
		text-decoration: underline;
	}
	@media screen and (max-width: 1300px) {
		div {
			flex-wrap: wrap;
		}
		.side_mini {
			display: flex;
			justify-content: center;
			top: auto;
			left: auto;
			position: relative;
		}
		.mention {
			position: relative;
			color: var(--text-primary-color);
			padding-top: 2rem;
			text-decoration: underline;
		}
	}
</style>
