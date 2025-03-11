<div>
	<div class="center">
		<span class="hypno">H</span><span class="hypno">Y</span><span class="hypno">P</span><span
			class="hypno">N</span
		><span class="hypno">O</span>
	</div>
</div>

<style>
	:root {
		--duration-hypno: 6s;
		--x-min-hypno: -100px;
		--x-max-hypno: 100px;
		--y-max-hypno: -50px;
	}
	.center {
		display: flex;
		justify-content: center;
		height: 100%;
		align-items: center;
		margin-bottom: 100px;
		/* transform: rotate(30deg); */
		animation: hypnocontain var(--duration-hypno) linear infinite;
	}
	.hypno {
		animation: hypnoloop var(--duration-hypno) linear infinite;
	}

	@keyframes hypnoloop {
		0% {
			transform: translateX(0px) translateY(0px);
		}
		8% {
			transform: translateX(0px) translateY(0px);
		}
		10% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}
		12% {
			transform: translateX(calc(var(--x-min-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(15deg);
		}
		15% {
			transform: translateX(var(--x-min-hypno)) translateY(var(--y-max-hypno)) rotate(30deg);
		}
		18% {
			transform: translateX(calc(var(--x-min-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(15deg);
		}
		20% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}
		22% {
			transform: translateX(calc(var(--x-max-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(-15deg);
		}
		25% {
			transform: translateX(var(--x-max-hypno)) translateY(var(--y-max-hypno)) rotate(-30deg);
		}
		28% {
			transform: translateX(calc(var(--x-max-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(-15deg);
		}
		30% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}
		32% {
			transform: translateX(calc(var(--x-min-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(15deg);
		}
		35% {
			transform: translateX(var(--x-min-hypno)) translateY(var(--y-max-hypno)) rotate(30deg);
		}
		38% {
			transform: translateX(calc(var(--x-min-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(15deg);
		}
		40% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}
		42% {
			transform: translateX(calc(var(--x-max-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(-15deg);
		}
		45% {
			transform: translateX(var(--x-max-hypno)) translateY(var(--y-max-hypno)) rotate(-30deg);
		}
		48% {
			transform: translateX(calc(var(--x-max-hypno) * 0.75))
				translateY(calc(var(--y-max-hypno) * 0.25)) rotate(-15deg);
		}
		50% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}

		100% {
			transform: translateX(0px) translateY(0px) rotate(0deg);
		}
	}
	@keyframes hypnocontain {
		0% {
			transform: rotate(0deg);
		}
		8% {
			transform: rotate(0deg);
		}
		10% {
			transform: rotate(0deg);
		}
		12% {
			transform: rotate(15deg);
		}
		15% {
			transform: rotate(30deg);
		}
		18% {
			transform: rotate(15deg);
		}
		20% {
			transform: rotate(0deg);
		}
		22% {
			transform: rotate(-15deg);
		}
		25% {
			transform: rotate(-30deg);
		}
		28% {
			transform: rotate(-15deg);
		}
		30% {
			transform: rotate(0deg);
		}
		32% {
			transform: rotate(15deg);
		}
		35% {
			transform: rotate(30deg);
		}
		38% {
			transform: rotate(15deg);
		}
		40% {
			transform: rotate(0deg);
		}
		42% {
			transform: rotate(-15deg);
		}
		45% {
			transform: rotate(-30deg);
		}
		48% {
			transform: rotate(-15deg);
		}
		50% {
			transform: rotate(0deg);
		}

		100% {
			transform: rotate(0deg);
		}
	}
</style>
