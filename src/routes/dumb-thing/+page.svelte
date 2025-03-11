<script lang="ts">
	import Chaos from '../../components/dumb/chaos.svelte';
	import Infinity from '../../components/dumb/infinity.svelte';
	import Shock from '../../components/dumb/shock.svelte';
</script>

<div id="container">
	<Infinity />
	<Chaos />
	<Shock />
</div>

<style>
	#container {
		padding-top: 50px;
	}
</style>
