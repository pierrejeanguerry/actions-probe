<script lang="ts">
	let randX = Math.random() * 40 - 20;

	function updateCSSVariables() {
		document.documentElement.style.setProperty('--rand-x-shock', `${randX}%`);
	}
	updateCSSVariables();
</script>

<div>
	<div class="center">
		<span class="shock">S</span><span class="shock">H</span><span class="shock">O</span><span
			class="shock">C</span
		><span class="shock">K</span>
	</div>
</div>

<style>
	:root {
		--pause-time-shock: 2s;
		--duration-shock: 4s;
	}
	.center {
		display: flex;
		justify-content: center;
		height: 100%;
		align-items: center;
		margin-bottom: 100px;
	}
	.shock {
		animation: shockloop var(--duration-shock) linear infinite forwards;
	}

	@keyframes shockloop {
		0% {
			transform: translateX(0px) translateY(0px);
			color: white;
			font-weight: 500;
		}
		25% {
			transform: translateX(0px) translateY(0px);
			color: white;
			font-weight: 500;
		}

		26% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		27% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		28% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		29% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		30% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		31% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		32% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		33% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		34% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		35% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		36% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		37% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		38% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		39% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		40% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		41% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		42% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		43% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		44% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		45% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		46% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		47% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		48% {
			transform: translateX(var(--rand-x-shock)) translateY(-3px);
			color: yellow;
			font-weight: 700;
		}
		49% {
			transform: translateX(0px) translateY(-3px);
			color: white;
			font-weight: 500;
		}
		50% {
			transform: translateX(0px) translateX(0px) translateY(0px);
			color: white;
			font-weight: 500;
		}
		60% {
			transform: rotate(-90deg);
		}

		95% {
			transform: rotate(-90deg);
		}
		100% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
			color: white;
		}
	}
</style>
