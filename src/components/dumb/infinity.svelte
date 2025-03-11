<div class="center">
	<span class="infinity">I</span><span class="infinity">N</span><span class="infinity">F</span><span
		class="infinity">I</span
	><span class="infinity">N</span><span class="infinity">I</span><span class="infinity">T</span
	><span class="infinity">Y</span>
</div>

<style>
	:root {
		--x-min-infinity: -100px;
		--x-max-infinity: 100px;
		--y-min-infinity: -50px;
		--y-max-infinity: 50px;
		--duration-infinity: 4s;
		--pause-time-infinity: 2s;
	}
	.center {
		display: flex;
		justify-content: center;
		height: 100%;
		align-items: center;
		margin-bottom: 100px;
	}
	.infinity {
		animation: infinityLoop calc(var(--duration-infinity)) linear infinite forwards;
	}

	.infinity:nth-child(1) {
		animation-delay: calc(var(--pause-time-infinity) * 0);
	}
	.infinity:nth-child(2) {
		animation-delay: calc(var(--pause-time-infinity) * 0.125);
	}
	.infinity:nth-child(3) {
		animation-delay: calc(var(--pause-time-infinity) * 0.25);
	}
	.infinity:nth-child(4) {
		animation-delay: calc(var(--pause-time-infinity) * 0.375);
	}
	.infinity:nth-child(5) {
		animation-delay: calc(var(--pause-time-infinity) * 0.5);
	}
	.infinity:nth-child(6) {
		animation-delay: calc(var(--pause-time-infinity) * 0.625);
	}
	.infinity:nth-child(7) {
		animation-delay: calc(var(--pause-time-infinity) * 0.75);
	}
	.infinity:nth-child(8) {
		animation-delay: calc(var(--pause-time-infinity) * 0.875);
	}

	@keyframes infinityLoop {
		0% {
			transform: translateX(0px) translateY(0px);
		}
		3.125% {
			transform: translateX(calc(var(--x-min-infinity) * 0.25))
				translateY(calc(var(--y-max-infinity) * 0.75));
		}
		6.25% {
			transform: translateX(calc(var(--x-min-infinity) * 0.5)) translateY(var(--y-max-infinity));
		}
		9.375% {
			transform: translateX(calc(var(--x-min-infinity) * 0.75))
				translateY(calc(var(--y-max-infinity) * 0.75));
		}
		12.5% {
			transform: translateX(var(--x-min-infinity)) translateY(0px);
		}
		15.625% {
			transform: translateX(calc(var(--x-min-infinity) * 0.75))
				translateY(calc(var(--y-min-infinity) * 0.75));
		}
		18.75% {
			transform: translateX(calc(var(--x-min-infinity) * 0.5)) translateY(var(--y-min-infinity));
		}
		21.875% {
			transform: translateX(calc(var(--x-min-infinity) * 0.25))
				translateY(calc(var(--y-min-infinity) * 0.75));
		}
		25% {
			transform: translateX(0px) translateY(0px);
		}
		28.125% {
			transform: translateX(calc(var(--x-max-infinity) * 0.25))
				translateY(calc(var(--y-max-infinity) * 0.75));
		}
		31.25% {
			transform: translateX(calc(var(--x-max-infinity) * 0.5)) translateY(var(--y-max-infinity));
		}
		34.375% {
			transform: translateX(calc(var(--x-max-infinity) * 0.75))
				translateY(calc(var(--y-max-infinity) * 0.75));
		}
		37.5% {
			transform: translateX(var(--x-max-infinity)) translateY(0px);
		}
		40.625% {
			transform: translateX(calc(var(--x-max-infinity) * 0.75))
				translateY(calc(var(--y-min-infinity) * 0.75));
		}
		43.75% {
			transform: translateX(calc(var(--x-max-infinity) * 0.5)) translateY(var(--y-min-infinity));
		}
		46.875% {
			transform: translateX(calc(var(--x-max-infinity) * 0.25))
				translateY(calc(var(--y-min-infinity) * 0.75));
		}
		50% {
			transform: translateX(0px) translateY(0px);
		}
		100% {
			transform: translateX(0px) translateY(0px);
		}
	}
</style>
