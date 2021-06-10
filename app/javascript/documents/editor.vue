<template>
	<section class="container">
		<h1 class="title">Create new document</h1>

		<slot name="errors"/>

		<div class="field">
			<label class="label">Name</label>
			<div class="control">
				<input class="input" type="text" name="document[title]" id="document_title" placeholder="Document title">
			</div>
		</div>

		<div class="field">
			<label class="label">Content</label>
			<div class="control">
				<textarea class="textarea" name="document[body]" id="document_body" placeholder="Document body"></textarea>
			</div>
		</div>

		<slot name="submit-button"/>
	</section>
</template>

<style scoped>
.container {
	margin: 4rem auto;
}

.form-errors {
	list-style: disc;
	padding-left: 3rem;
	margin-top: 0.5rem;
}

.button {
	margin-top: 1rem;
}
</style>