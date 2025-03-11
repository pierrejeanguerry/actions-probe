<script lang="ts">
	import Fa from 'svelte-fa';
	import { isOpen, showComponent } from './event';
	import {
		faBook,
		faBriefcase,
		faClose,
		faFlaskVial,
		faFolderTree,
		faGraduationCap,
		faHome,
		faLayerGroup
	} from '@fortawesome/free-solid-svg-icons';
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	let showModal: boolean;
	isOpen.subscribe((value) => {
		showModal = value;
	});
	function closeModal() {
		isOpen.set(false);
	}

	function changePage(path: string) {
		closeModal();
		if (path != $page.url.pathname) {
			if (window.innerWidth <= 1400) {
				goto(path);
			} else {
				showComponent.set(false);
				goto(path);
				setTimeout(() => {
					showComponent.set(true);
				}, 1000);
			}
		}
	}
</script>

<div class={`modal ${!showModal && 'no-modal'}`}>
	<button on:click={closeModal} class="close">
		<Fa icon={faClose} />
	</button>
	<button class="button" on:click={() => changePage('/#to-scroll')}>
		<Fa icon={faHome} />
		<p>Accueil</p>
	</button>
	<button class="button" on:click={() => changePage('/experiences#to-scroll')}>
		<Fa icon={faBriefcase} />
		<p>Expériences professionnels</p>
	</button>
	<button class="button" on:click={() => changePage('/formations#to-scroll')}>
		<Fa icon={faGraduationCap} />
		<p>Mes formations</p>
	</button>
	<button class="button" on:click={() => changePage('/competences#to-scroll')}>
		<Fa icon={faLayerGroup} />
		<p>Compétences</p>
	</button>
	<button class="button" on:click={() => changePage('/projets#to-scroll')}>
		<Fa icon={faFolderTree} />
		<p>Mes projets</p>
	</button>
	<button class="button" on:click={() => changePage('/bibliographie#to-scroll')}>
		<Fa icon={faBook} />
		<p>Bibliographie</p>
	</button>
	<button class="button" on:click={() => changePage('/lab#to-scroll')}>
		<Fa icon={faFlaskVial} />
		<p>Lab</p>
	</button>
</div>

<style>
	.button {
		height: 3rem;
		background-color: var(--bg-primary-color);
		color: var(--text-primary-color);
		display: flex;
		align-items: center;
		justify-content: center;
		transition: all 500ms;
		border: 1px solid var(--bg-primary-color);
		gap: 1rem;
	}

	.close {
		display: block;
		position: fixed;
		width: 60px;
		height: 60px;
		background-color: var(--bg-primary-color);
		padding: 1.25rem;
		align-self: center;
		border-radius: 100%;
		right: 2rem;
		top: 2rem;
		z-index: 1;
		transition: all 500ms;
		border: 2px solid lightgray;
		color: var(--text-primary-color);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.close:hover {
		color: red;
		background-color: #08101f;

		border: 2px solid red;
	}
	.modal {
		transition: ease-in-out 0.5 all;
		background-color: var(--bg-primary-color);
		border-right: 2px solid #131f30;
		z-index: 3;
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		width: 300px;
		box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
		transition: all 0.3s ease;
		display: flex;
		flex-direction: column;
		justify-content: center;
		gap: 2rem;
		transform: translateX(0);
		opacity: 1;
	}

	.no-modal {
		transform: translateX(100%);
		opacity: 0;
		visibility: hidden;
		pointer-events: none;
		transition: all 0.3s ease;
	}

	button p {
		font-size: large;
	}
</style>
