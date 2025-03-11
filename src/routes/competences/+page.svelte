<script lang="ts">
	import { iconMapping } from '../icon-mapping';

	import competences from './competences.json';

	import Skill from '../../components/skill.svelte';
</script>

<h2 class="title">Compétences</h2>

{#each competences as type}
	<section>
		<h3 class="title">{type.title}</h3>
		<div class="list">
			{#each type.list as competence}
				{#if !iconMapping[competence.icon]}
					<Skill
						path={competence.icon}
						alt={competence.alt}
						description={competence.description}
						style={competence.style}
						hoverStyle={competence.hoverStyle}
					/>
				{:else}
					<Skill image={iconMapping[competence.icon]} description={competence.description} />
				{/if}
			{/each}
		</div>
	</section>
{/each}

<style>
	section {
		font-size: xx-large;
	}

	.list {
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;
		gap: 20px;
	}

	h3 {
		font-weight: 400;
		font-size: 40px;
		font-style: normal;
		font-family: var(--primary-font);
		margin-top: 2.5rem;
		margin-bottom: 2.5rem;
	}

	@media screen and (max-width: 1300px) {
		h3 {
			font-weight: 400;
			font-size: 30px;
			font-style: normal;
			font-family: var(--primary-font);
			margin-top: 2rem;
			margin-bottom: 2rem;
		}
	}
</style>
