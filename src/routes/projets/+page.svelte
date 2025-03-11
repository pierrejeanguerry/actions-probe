<script lang="ts">
	import Project from '../../components/project.svelte';
	import projects from './projects.json';
</script>

<h2 class="title">Mes projets</h2>

<section>
	<div class="project">
		{#each projects as project}
			<Project
				title={project.title}
				imagePath={project.imagePath}
				imageAlt={project.imageAlt}
				descriptions={project.descriptions}
				link={project.link || null}
				skills={project.skills}
			/>
			<hr />
		{/each}
	</div>
</section>

<style>
	hr {
		margin-top: 2rem;
		margin-bottom: 2rem;
	}
</style>
