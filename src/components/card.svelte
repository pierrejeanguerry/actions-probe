<script lang="ts">
	import { page } from '$app/stores';
	import { goto } from '$app/navigation';
	import { showComponent } from './event';

	let path: string;
	let mini: boolean = false;

	$: {
		path = $page.url.pathname;
		mini = path !== '/';
	}

	function changePage(url: string) {
		if (url != $page.url.pathname) {
			showComponent.set(false);
			goto(url);
			setTimeout(() => {
				showComponent.set(true);
			}, 1000);
		}
	}
</script>

<div class={mini ? 'card_mini' : 'card'}>
	<div class="image-container">
		<img
			class={mini ? 'image_mini' : 'image'}
			id="photo_id"
			src="DSC_0671_GUERRY Pierre-Jean.JPG
	"
			alt=""
		/>
	</div>
	<div class={mini ? 'card-content_mini' : 'card-content'}>
		<h2 class={mini ? 'title_mini' : 'title'}>Pierre-Jean GUERRY</h2>
		<button
			on:click={() => changePage('/contact#to-scroll')}
			class={mini ? 'button_mini' : 'button'}>Contactez moi</button
		>
	</div>
</div>

<style>
	.card {
		translate: none;
		height: fit-content;
		width: fit-content;
		border-width: 2px;
		border-color: var(--bg-primary-color);
		border-radius: 240px 40px 40px 40px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		padding: 20px;
		position: relative;
		transition: all, 300ms;
	}
	.card_mini {
		translate: -100px 40px;
		height: fit-content;
		width: fit-content;
		border-width: 2px;
		border-color: var(--bg-primary-color);
		border-radius: 60px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		padding: 20px;
		position: relative;
		transition: all, 300ms;
	}

	.image {
		object-fit: cover;
		display: block;
		width: auto;
		height: 94vh;
		border-radius: 240px 40px 60px 60px;
		transition: all, 300ms;
	}

	.image_mini {
		object-fit: cover;
		display: block;
		width: auto;
		height: 30vh;
		max-width: 10vw;
		border-radius: 60px;
		transition: all, 300ms;
	}

	.title {
		color: var(--text-primary-color);
		font-size: xx-large;
		font-weight: 800;
		font-family: var(--secondary--font);
		transition: all, 300ms;
	}
	.title_mini {
		color: var(--text-primary-color);
		font-size: medium;
		font-weight: 700;
		font-family: var(--secondary--font);
		transition: all, 300ms;
	}

	.card-content {
		position: absolute;
		bottom: 20px;
		width: calc(100% - 40px);
		min-height: 13vh;
		border-radius: 0px 0px 60px 60px;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
		align-items: center;
		background: var(--background-blur);
		backdrop-filter: blur(5px);
		background: rgba(9, 16, 26, 0.9);
		transition: all, 300ms;
	}

	.card-content_mini {
		position: absolute;
		text-align: center;
		bottom: 20px;
		width: calc(100% - 40px);
		min-height: 5vh;
		border-radius: 0px 0px 30px 30px;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
		align-items: center;
		background: var(--background-blur);
		backdrop-filter: blur(5px);
		background: rgba(9, 16, 26, 0.9);
		transition: all, 300ms;
	}

	.button {
		font-size: large;
		color: black;
		width: 80%;
		padding-top: 1.25rem;
		padding-bottom: 1.25rem;
		border-radius: 1.5rem;
		background-color: var(--bg-secondary-color);
		border: 3px solid var(--bg-secondary-color);
		transition:
			background-color 0.3s,
			color 0.3s,
			border-radius 0.3s;
	}

	.button_mini {
		display: none;
	}

	.button:hover {
		color: var(--text-primary-color);
		width: 80%;
		padding-top: 1.25rem;
		padding-bottom: 1.25rem;
		border-radius: 0;
		background-color: #06142d;
		border: 3px solid var(--bg-secondary-color);
	}

	@media screen and (max-width: 1300px) {
		.card {
			width: fit-content;
			height: fit-content;
			border-width: 2px;
			border-color: #111c2c;
			border-radius: 60px;
		}

		.card_mini {
			translate: none;
			width: fit-content;
			height: fit-content;
			border-width: 2px;
			border-color: #111c2c;
			border-radius: 60px;
		}

		.image-container {
			position: relative;
			width: 100%;
			overflow: hidden;
		}

		.image {
			object-fit: cover;
			border-radius: 60px;
		}

		.image_mini {
			object-fit: cover;
			display: block;
			width: auto;
			max-width: 100%;
			height: 94vh;
			border-radius: 240px 40px 60px 60px;
			transition: all, 300ms;
			object-fit: cover;
			border-radius: 60px;
		}

		.title {
			color: var(--text-primary-color);
			font-size: x-large;
			font-weight: 600;
			font-family: var(--secondary--font);
		}

		.title_mini {
			color: var(--text-primary-color);
			font-size: x-large;
			font-weight: 600;
			font-family: var(--secondary--font);
			transition: all, 300ms;
		}

		.card-content {
			position: absolute;
			bottom: 20px;
			width: calc(100% - 40px);
			min-height: 13rem;
			max-height: 10vh;
			border-radius: 0px 0px 60px 60px;
			display: flex;
			flex-direction: column;
			justify-content: space-evenly;
			align-items: center;
			background: var(--background-blur);
			backdrop-filter: blur(5px);
			background: rgba(9, 16, 26, 0.9);
			transition: all, 300ms;
		}

		.card-content_mini {
			position: absolute;
			bottom: 20px;
			width: calc(100% - 40px);
			min-height: 13rem;
			max-height: 10vh;
			border-radius: 0px 0px 60px 60px;
			display: flex;
			flex-direction: column;
			justify-content: space-evenly;
			align-items: center;
			background: var(--background-blur);
			backdrop-filter: blur(5px);
			background: rgba(9, 16, 26, 0.9);
			transition: all, 300ms;
		}

		.button_mini {
			display: block;
			font-size: large;
			color: black;
			width: 80%;
			padding-top: 1.25rem;
			padding-bottom: 1.25rem;
			border-radius: 1.5rem;
			background-color: var(--bg-secondary-color);
			border: 3px solid var(--bg-secondary-color);
		}
		.button:hover {
			display: block;
			font-size: large;
			color: black;
			width: 80%;
			padding-top: 1.25rem;
			padding-bottom: 1.25rem;
			border-radius: 1.5rem;
			background-color: var(--bg-secondary-color);
			border: 3px solid var(--bg-secondary-color);
		}
	}
</style>
