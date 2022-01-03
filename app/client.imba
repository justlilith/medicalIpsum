import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'

let ipsumArgs = {
	medAmount\number
	, length\number
}
let outBlock\string = ""

global css html
	ff:sans

tag app
	<self>
		<header>
			<h1> "Medical Ipsum"
			<p> "Lorem ipsum generator with medical flair 💊"
			<section>
				<label d:block> "How much medicine?"
				<input d:block type="range" bind=ipsumArgs.medAmount data="50">
				<label d:block> "How much text?"
				<input d:block type="number" bind=ipsumArgs.length data="5">
				<button d:block @click.prevent=(do (outBlock = Helpers.generateIpsum(ipsumArgs)))> "Generate ipsum, stat!"
			# <input> "Ipsum"
			# <p> "{loremBOW[9]}"
			<section>
				<textarea bind=outBlock>

imba.mount <app>