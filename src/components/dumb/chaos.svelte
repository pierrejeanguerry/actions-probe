<script lang="ts">
	let randX = Math.random() * 100;
	let randY = Math.random() * 100;
	let delay1 = Math.random();
	let delay2 = Math.random();
	let delay3 = Math.random();
	let delay4 = Math.random();
	let delay5 = Math.random();
	let duration = Math.random() * 10;

	function updateCSSVariables() {
		document.documentElement.style.setProperty('--rand-x-chaos', `${randX}%`);
		document.documentElement.style.setProperty('--rand-y-chaos', `${randY}%`);
		document.documentElement.style.setProperty('--delay-1-chaos', `${delay1}`);
		document.documentElement.style.setProperty('--delay-2-chaos', `${delay2}`);
		document.documentElement.style.setProperty('--delay-3-chaos', `${delay3}`);
		document.documentElement.style.setProperty('--delay-4-chaos', `${delay4}`);
		document.documentElement.style.setProperty('--delay-5-chaos', `${delay5}`);
		document.documentElement.style.setProperty('--duration-chaos', `${duration}s`);
	}

	setInterval(() => {
		randX = Math.random() * 200 - 100;
		randY = Math.random() * 200 - 100;
		delay1 = Math.random();
		delay2 = Math.random();
		delay3 = Math.random();
		delay4 = Math.random();
		delay5 = Math.random();
		duration = Math.random() * 10;
		updateCSSVariables();
	}, 200);
	updateCSSVariables();
</script>

<div>
	<div class="center">
		<span class="chaos">C</span><span class="chaos">H</span><span class="chaos">A</span><span
			class="chaos">O</span
		><span class="chaos">S</span>
	</div>
</div>

<style>
	:root {
		--pause-time-chaos: 2s;
	}
	.center {
		display: flex;
		justify-content: center;
		height: 100%;
		align-items: center;
		margin-bottom: 100px;
	}
	.chaos {
		animation: chaosloop var(--duration-chaos) linear infinite forwards;
	}

	.chaos:nth-child(1) {
		animation-delay: calc(var(--pause-time-chaos) * var(--delay-1-chaos));
	}
	.chaos:nth-child(2) {
		animation-delay: calc(var(--pause-time-chaos) * var(--delay-2-chaos));
	}
	.chaos:nth-child(3) {
		animation-delay: calc(var(--pause-time-chaos) * var(--delay-3-chaos));
	}
	.chaos:nth-child(4) {
		animation-delay: calc(var(--pause-time-chaos) * var(--delay-4-chaos));
	}
	.chaos:nth-child(5) {
		animation-delay: calc(var(--pause-time-chaos) * var(--delay-5-chaos));
	}

	@keyframes chaosloop {
		0% {
			transform: translateX(0px) translateY(0px);
		}
		3.125% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		6.25% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		9.375% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		12.5% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		15.625% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		18.75% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		21.875% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		25% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		28.125% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		31.25% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		34.375% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		37.5% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		40.625% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		43.75% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		46.875% {
			transform: translateX(var(--rand-x-chaos)) translateY(var(--rand-y-chaos));
		}
		50% {
			transform: translateX(0px) translateY(0px);
		}
		100% {
			transform: translateX(0px) translateY(0px);
		}
	}
</style>
