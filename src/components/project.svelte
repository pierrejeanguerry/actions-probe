<script lang="ts">
	import { faArrowUpRightFromSquare } from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';
	import { onMount } from 'svelte';

	export let imagePath: string;
	export let imageAlt: string;
	export let title: string;
	export let descriptions: Array<string>;
	export let skills: Array<string>;
	export let link: string | null;

	let scaleFactor = 1;
	let isMobile = window.innerWidth < 1300;
	window.addEventListener('resize', () => {
		isMobile = window.innerWidth < 1300;
	});
	function updateScaleFactor(wrapperWidth: number) {
		const contentWidth = 1920;
		scaleFactor = wrapperWidth / contentWidth;
	}

	$: updateScaleFactor(0.35 * window.innerWidth);

	onMount(() => {
		window.addEventListener('resize', () => updateScaleFactor(0.35 * window.innerWidth));
		return () =>
			window.removeEventListener('resize', () => updateScaleFactor(0.35 * window.innerWidth));
	});
</script>

<div class="project-card">
	<div class="left">
		<h2 class="project-title">{title}</h2>
		{#if imagePath.startsWith('https://')}
			<div class="iframe-wrapper">
				<div class="modal-iframe">?</div>
				<iframe
					class="embed"
					title={imageAlt}
					src={imagePath}
					style={isMobile ? '' : `transform: scale(${scaleFactor});`}
				></iframe>
			</div>
		{:else}
			<img src={imagePath} alt={imageAlt} />
		{/if}
	</div>
	<div class="right">
		<ul class="project-descriptions">
			{#each descriptions as description}
				<li class="project-li">{description}</li>
			{/each}
		</ul>
		<div class="project-link">
			{#if !link}
				<p></p>
			{:else if link === ''}
				<p class="link">Work in progress...</p>
			{:else}
				<a class="link-line" href={link} target="_blank">{link} </a>
				<Fa icon={faArrowUpRightFromSquare} />
			{/if}
		</div>

		<div class="project-skills">
			{#each skills as skill}
				<div class="skill-tag">
					<p>
						{skill}
					</p>
				</div>
			{/each}
		</div>
	</div>
</div>

<style>
	.project-card {
		margin-top: 20px;
		width: 100%;
		display: flex;
		justify-content: space-around;
	}

	.link {
		font-family: var(--primary-font);
	}

	.link-line {
		font-family: var(--primary-font);
		text-decoration: underline;
	}

	.left {
		width: 30vw;
		height: 30vh;
		transition:
			width 0.3s,
			height 0.3s;
		display: flex;
		flex-direction: column;
		overflow: hidden;
		filter: grayscale(100%);
	}
	.left:hover {
		width: 60vw;
		height: 40vh;
		filter: none;
	}
	img {
		position: relative;
		align-self: center;
		max-width: 100%;
		max-height: 100%;
	}
	.right {
		padding-left: 2rem;
		width: 50vw;
		display: flex;
		flex-direction: column;
		gap: 20px;
	}
	.project-title {
		position: relative;
		color: var(--text-primary-color);
		text-align: center;
		font-weight: 600;
	}
	.project-link {
		display: flex;
		flex-direction: row;
		gap: 10px;
		justify-content: center;
	}
	.project-skills {
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;
		gap: 10px;
	}

	.skill-tag {
		border-radius: 1rem;
		border: black 2px solid;
		background-color: #43b280;
		color: black;
		font-weight: 500;
		padding: 5px;
	}

	.project-li {
		font-size: large;
		font-family: var(--primary-font);
	}

	.iframe-wrapper {
		position: relative;
		align-self: center;
		width: 100%;
		max-height: 100%;
	}

	.embed {
		width: 1920px;
		height: 1080px;
		position: absolute;
		top: 0;
		left: 0;
		transform-origin: top left;
	}

	@media screen and (max-width: 1300px) {
		.project-card {
			margin-top: 20px;
			display: flex;
			flex-direction: column;
			justify-content: baseline;
		}

		.left {
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			flex-direction: column;
			filter: none;
		}

		.left:hover {
			width: 100%;
			height: fit-content;
		}
		.right {
			margin-top: 1rem;
			width: 80vw;
			padding-left: 0.5rem;
			padding-right: 0.5rem;
			display: flex;
			flex-direction: column;
			gap: 10px;
			padding-left: 0rem;
		}
		.project-title {
			position: relative;
			color: var(--text-primary-color);
			text-align: center;
			font-size: larger;
			font-weight: 600;
			font-family: var(--secondary-font);
		}
		.project-link {
			display: flex;
			flex-direction: row;
			gap: 10px;
			justify-content: center;
			text-decoration: underline;
			flex-wrap: wrap;
			font-family: var(--primary-font);
		}
		.project-skills {
			display: flex;
			justify-content: space-around;
			flex-wrap: wrap;
			gap: 5px;
		}
		img {
			align-self: center;

			max-width: 80vw;
			max-height: 70vh;
		}
		.iframe-wrapper {
			align-self: center;
			width: 80vw;
			height: 70vh;
		}

		.embed {
			width: 100%;
			height: 100%;
		}
	}
	@keyframes pulse {
		0% {
			transform: scale(1) rotate(0deg);
		}
		50% {
			transform: rotate(0.5deg);
		}
		53% {
			transform: rotate(-0.5deg);
		}
		56% {
			transform: rotate(0.5deg);
		}
		59% {
			transform: rotate(0deg);
		}
	}
</style>
