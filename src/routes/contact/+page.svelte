<script lang="ts">
	import { faAt, faPhone } from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';
</script>

<div class="flex flex-col">
	<h2 class="title">Contactez-moi</h2>
	<section>
		<a class="contact" href="mailto:pierre-jean.guerry@ecole-hexagone.com">
			<Fa icon={faAt} /> pierre-jean.guerry@ecole-hexagone.com</a
		>
		<a class="contact" href="mailto:pjguerry976@hotmail.fr">
			<Fa icon={faAt} /> pjguerry976@hotmail.fr</a
		>
		<div class="contact"><Fa icon={faPhone} /> 0777983515</div>
	</section>
</div>

<style>
	.contact {
		display: flex;
		flex-direction: row;
		align-items: center;
		color: var(--text-primary-color);
		padding-top: 1.25rem;
		padding-bottom: 1.25rem;
		font-size: large;
		transition: all, 300ms;
		gap: 10px;
		padding: 5px;
	}

	@media screen and (max-width: 1600px) {
	}
</style>
