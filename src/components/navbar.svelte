<script lang="ts">
	import Fa from 'svelte-fa';
	import {
		faHome,
		faBriefcase,
		faLayerGroup,
		faFolderTree,
		faGraduationCap,
		faFlaskVial,
		faBook
	} from '@fortawesome/free-solid-svg-icons';
	import { showComponent } from './event';
	import { goto } from '$app/navigation';

	import { page } from '$app/stores';
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

<nav class={mini ? 'nav_mini' : 'nav'}>
	<div class={mini ? 'contain_mini' : 'contain'}>
		<button
			class={`rounded-t-3xl ${mini ? 'button_mini' : 'button'}`}
			on:click={() => changePage('/')}
		>
			<Fa icon={faHome} />
		</button>
		<button class={mini ? 'button_mini' : 'button'} on:click={() => changePage('/experiences')}
			><Fa icon={faBriefcase} /></button
		>
		<button class={mini ? 'button_mini' : 'button'} on:click={() => changePage('/formations')}>
			<Fa icon={faGraduationCap} />
		</button>
		<button class={mini ? 'button_mini' : 'button'} on:click={() => changePage('/competences')}>
			<a href="/competences"> <Fa icon={faLayerGroup} /></a>
		</button>
		<button class={mini ? 'button_mini' : 'button'} on:click={() => changePage('/projets')}>
			<Fa icon={faFolderTree} />
		</button>
		<button class={mini ? 'button_mini' : 'button'} on:click={() => changePage('/bibliographie')}>
			<Fa icon={faBook} />
		</button>
		<button
			class={`rounded-b-3xl ${mini ? 'button_mini' : 'button'}`}
			on:click={() => changePage('/lab')}
		>
			<Fa icon={faFlaskVial} />
		</button>
	</div>
</nav>

<style>
	.nav {
		translate: 0px 0px;
		display: flex;
		margin-top: 2rem;
		margin-right: 2rem;
		margin-left: 2rem;
		margin-bottom: 2rem;
		display: flex;
		flex-direction: column;
		justify-content: center;
		transition: all, 300ms;
	}

	.nav_mini {
		translate: 0 40vh;
		display: flex;
		margin-top: 2rem;
		margin-right: 2rem;
		margin-left: 2rem;
		margin-bottom: 2rem;
		display: flex;
		flex-direction: column;
		justify-content: center;
		transition: all, 300ms;
	}
	.contain {
		display: flex;
		flex-direction: column;
		gap: 0.2rem;
		width: 4rem;
	}

	.contain_mini {
		display: flex;
		flex-direction: column;
		gap: 0.2rem;
		width: 4rem;
	}

	.button {
		padding: 30px 10px 30px 10px;
		background-color: var(--bg-primary-color);
		color: var(--text-primary-color);
		display: flex;
		align-items: center;
		justify-content: center;
		transition: all 500ms;
		border: 1px solid var(--bg-primary-color);
	}

	.button:hover {
		color: var(--bg-secondary-color);
		border: 1px solid var(--bg-secondary-color);
	}
	.button_mini {
		padding: 25px 10px 25px 10px;
		background-color: var(--bg-primary-color);
		color: var(--text-primary-color);
		display: flex;
		align-items: center;
		justify-content: center;
		transition: all 500ms;
		border: 1px solid var(--bg-primary-color);
	}

	.button_mini:hover {
		color: var(--bg-secondary-color);
		border: 1px solid var(--bg-secondary-color);
	}

	@media screen and (max-width: 1300px) {
		.nav {
			display: none;
		}
		.nav_mini {
			display: none;
		}
	}
</style>
