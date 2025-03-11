<script lang="ts">
	type Book = {
		author: string;
		date: string;
		description: string;
		id: number;
		subtitle: string;
		title: string;
		status: string;
		path: string;
	};
	let books: Book[] = [];
	fetch('http://127.0.0.1:8000/books', { method: 'GET' })
		.then((res) => res.json())
		.then((data) => {
			books = data;
		});
	function onDelete(id: number) {
		fetch(`http://127.0.0.1:8000/books/${id}`, { method: 'DELETE' }).then(() => {
			books = books.filter((book) => book.id !== id);
			console.log('deleted');
		});
	}
</script>

<h2 class="title">Bibliographie</h2>
{#each books as book}
	<div class="row">
		<div class="col {book.status}">
			<img src={book.path} alt="" class="img-book" />
		</div>
		<div class="col">
			<div class="book-description">
				<h3>{book.title}</h3>
				<p>{book.subtitle}</p>
				<p>{book.author}</p>
				<p>{book.date}</p>
				<p>{book.description}</p>
			</div>
		</div>
		<div class="col">
			<p class="status">{book.status}</p>
		</div>
	</div>
	<button on:click={() => onDelete(book.id)}>Supprimer</button>
{/each}

<style>
	.row {
		display: flex;
		flex-direction: row;
		justify-content: space-evenly;
		align-items: center;
		margin-bottom: 1rem;
		flex-wrap: wrap;
		padding: 0.5rem;
	}

	.col {
		width: 33%;
	}
	.col.pending {
		border-left-width: 0.25rem;
		border-left-color: #e9ca58;
	}
	.col.finished {
		border-left-width: 0.25rem;
		border-left-color: #31438a;
	}
	.col.reading {
		border-left-width: 0.25rem;
		border-left-color: #59ad4b;
	}
	.col.dropped {
		border-left-width: 0.25rem;
		border-left-color: #933a34;
	}
	.col.planned {
		border-left-width: 0.25rem;
		border-left-color: #c3c3c3;
	}
	.img-book {
		width: 40%;
		justify-self: center;
		padding-top: 1rem;
		padding-bottom: 1rem;
	}
	.book-description {
		justify-self: flex-start;
	}
	.status {
		font-size: large;
		font-weight: bold;
		justify-self: center;
	}
	@media screen and (max-width: 1600px) {
		.col {
			width: 100%;
			padding-left: 1rem;
			padding-right: 1rem;
			text-align: center;
		}
		.book-description {
			justify-self: center;
		}
	}
</style>
