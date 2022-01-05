import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'

let ipsum-args = {
	medAmount\number
	, length\number
}
let out-block\string = ""

console.log("MI [i]: Now running . . .")

# APP

tag app
	<self>
		<header>
			<h1> "Medical Ipsum"
			<p> "Lorem ipsum generator with medical flair 💊"
		<section>
			<label.label> "How much medicine?"
			<input type="range" bind=ipsum-args.medAmount data="90">
			<label.label> "How many sentences?"
			<input type="number" bind=ipsum-args.length data="5">
			<button @click.prevent=(do (out-block = Helpers.generateIpsum(ipsum-args)))> "Generate ipsum, stat!"
		<section>
			<section.out>
				<p.out-block> out-block
				<button.clipboard @click.prevent=(do Helpers.copyToClipboard(out-block))> "Copy to clipboard"
	# CSS
	css * ff:serif p:.5em c:black ta:center a:center m:auto
		self w:50% m:auto
		h1 ff:Garamond,serif ta:center
		p ta:center
		[type="range"] w:30
		button,input d:block
		.out min-height:200px bd:thin solid grey d:flex fld:column jc:end
		.out-block m:0 auto flg:100
		.clipboard m:0 auto

imba.mount <app>

# POST-MOUNT

console.log(ipsum-args)
