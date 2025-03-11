<script>
	import { faGithub, faGitlab, faLinkedin } from '@fortawesome/free-brands-svg-icons';
	import {
		faBookOpen,
		faComputer,
		faDiceD20,
		faGamepad,
		faMusic,
		faTrophy,
		faUtensils
	} from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';
</script>

<div class="flex flex-col justify-around h-full">
	<div>
		<section class="container">
			<h2 class="title">A propos de moi</h2>
			<p class="contain">
				Dans le cadre de mon cursus en vue d’obtenir un grade de mastère en Intelligence
				Artificielle, curieux et autonome, j’ai une forte envie d’acquérir des connaissances et de
				me former dans un univers professionnel dynamique. De plus, je justifie d’une expérience
				professionnelle significative.
			</p>
		</section>
		<section class="container">
			<h3 class="title">Centres d'intérets</h3>
			<ul class="list">
				<li class="interest">
					<Fa icon={faMusic} style="font-size: 1.2rem;" />
					<p>
						Musique - Découvrir de nouveaux groupes, genres et albums dans une variété de styles.
					</p>
				</li>
				<li class="interest">
					<Fa icon={faTrophy} style="font-size: 1.2rem;" />
					<p>
						E-sport - Intérêt pour la compétition, notamment dans le domaine du versus fighting.
					</p>
				</li>
				<li class="interest">
					<Fa icon={faGamepad} style="font-size: 1.2rem;" />
					<p>Gaming - Intérêt pour les jeux vidéo indépendants et expérimentaux.</p>
				</li>
				<li class="interest">
					<Fa icon={faBookOpen} style="font-size: 1.2rem;" />
					<p>Manga - Passion pour les mangas et la culture japonaise.</p>
				</li>
				<li class="interest">
					<Fa icon={faComputer} style="font-size: 1.2rem;" />
					<p>Informatique - M'informer sur les dernières technologies et l'innovation numérique.</p>
				</li>
				<li class="interest">
					<Fa icon={faUtensils} style="font-size: 1.2rem;" />
					<p>
						Cuisiner - Apprendre de nouvelles recettes, expérimenter en cuisine et régaler mon
						entourage.
					</p>
				</li>
				<li class="interest">
					<Fa icon={faDiceD20} style="font-size: 1.2rem;" />
					<p>
						Jeu de roles - M'immerger dans des univers fictifs, qu'ils soient fantastiques ou
						réalistes, tout en partageant des moments conviviaux avec des amis.
					</p>
				</li>
			</ul>
		</section>
		<section class="container">
			<h3 class="title">Mes réseaux</h3>
			<ul class="list-row">
				<li class="interest">
					<a class="icon" href="https://github.com/pierrejeanguerry" target="_blank">
						<Fa icon={faGithub} />
					</a>
				</li>
				<li class="interest">
					<a class="icon" href="https://gitlab.com/pjguerry976" target="_blank">
						<Fa icon={faGitlab} />
					</a>
				</li>
				<li class="interest">
					<a
						class="icon"
						href="https://www.linkedin.com/in/pierre-jean-guerry-6a4570239"
						target="_blank"
					>
						<Fa icon={faLinkedin} />
					</a>
				</li>
			</ul>
		</section>
	</div>
</div>

<style>
	.icon {
		font-size: 2rem;
	}

	.contain {
		display: flex;
		flex-direction: row;
		align-items: flex-start;
	}
	div div {
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}

	p {
		color: var(--text-secondary-color);
		font-weight: 500;
		font-size: larger;
		font-style: normal;
		font-family: var(--primary-font);
	}
	.list {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}
	.list-row {
		display: flex;
		flex-direction: row;
		gap: 1rem;
	}

	.interest {
		display: flex;
		flex-direction: row;
		align-items: start;
		gap: 1.25rem;
	}

	@media screen and (max-width: 1300px) {
		p {
			color: var(--text-secondary-color);
			font-weight: 500;
			font-size: large;
			font-style: normal;
			font-family: var(--primary-font);
		}

		.contain {
			font-size: large;
			display: flex;
			flex-direction: row;
			align-items: flex-start;
			justify-content: center;
		}

		.list-row {
			justify-content: center;
			gap: 2rem;
		}
		.interest {
			justify-content: center;
		}
		.container {
			padding-bottom: 1rem;
		}
	}
</style>
