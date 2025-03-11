<script lang="ts">
	import Fa from 'svelte-fa';
	import { faBars } from '@fortawesome/free-solid-svg-icons';
	import { isOpen } from './event';

	function openModal() {
		isOpen.set(true);
	}
</script>

<button on:click={openModal} class="burger">
	<Fa icon={faBars} color="white" />
</button>

<style>
	.burger {
		display: none;
	}

	@media screen and (max-width: 1300px) {
		.burger {
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
			border: 2px solid lightgray;
			display: flex;
			align-items: center;
			justify-content: center;
		}
	}
</style>
