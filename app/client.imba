import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'

let ipsum-args = {
	medAmount\number
	, length\number
}
let out-block\string = ""

console.log("test")

# APP

tag app
	<self>
		<header>
			<h1> "Medical Ipsum"
			<p> "Lorem ipsum generator with medical flair 💊"
		<section>
			<label .label> "How much medicine?"
			<input type="range" bind=ipsum-args.medAmount data="90">
			<label .label> "How many sentences?"
			<input type="number" bind=ipsum-args.length data="5">
			<button @click.prevent=(do (outBlock = Helpers.generateIpsum(ipsum-args)))> "Generate ipsum, stat!"
		<section>
			<button .clipboard @click.prevent=(do Helpers.copyToClipboard(out-block))> "Copy to clipboard"
			<textarea bind=out-block>
	# CSS
	css * ff:serif p:.5em c:black
		self w:50% m:auto
		h1 ff:Garamond,serif ta:center
		p ta:center
		button,input d:block

imba.mount <app>