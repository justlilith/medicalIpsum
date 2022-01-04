import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'

let ipsum-args = {
	medAmount\number
	, length\number
}
let out-block\string = ""

# APP

tag app
	<self>
		<header>
			<h1> "Medical Ipsum"
			<p> "Lorem ipsum generator with medical flair 💊"
			<section>
				<label c:label> "How much medicine?"
				<input type="range" bind=ipsum-args.medAmount data="50">
				<label c:label> "How much text?"
				<input type="number" bind=ipsum-args.length data="5">
				<button @click.prevent=(do (outBlock = Helpers.generateIpsum(ipsum-args)))> "Generate ipsum, stat!"
			<section>
				<textarea bind=out-block>
				<button @click.prevent=(do Helpers.copyToClipboard(out-block))> "Copy to clipboard"
	# CSS
	css button d:block
	css label d:block
	css	input d:block

imba.mount <app>

# CSS

global css html
	ff:sans

