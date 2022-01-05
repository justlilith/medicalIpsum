import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'
import '$lib/tags/theme-switch.imba'

let state = {
	dark-mode\boolean : true
	theme: 'dark'
	} # using number as a bool here because range input

let ipsum-args = {
	medAmount\number
	, length\number
}
let out-block\string = ""

console.log("MI [i]: Now running . . .")

# APP

tag app
	<self.{state.theme}.self>
		<theme-switch bind=state>
		<header>
			<h1> "Medical Ipsum"
			<p> "Lorem ipsum generator with medical flair 💊"
			<div.divider>
		<section.container>
			<div.row>
				<label.label> "How much medicine?"
				<input.{state.theme} type="range" bind=ipsum-args.medAmount data="90">
			<div.row>
				<label.label> "How many sentences?"
				<input.{state.theme} type="number" bind=ipsum-args.length data="5">
			<button.{state.theme} @click.prevent=(do (out-block = Helpers.generateIpsum ipsum-args; state.theme = 'dark'))> "Generate ipsum, stat!"
		<section>
			<section.out>
				<p.out-block> out-block
				<button.{state.theme}.clipboard @click.prevent=(do Helpers.copyToClipboard out-block)> "Copy to clipboard"

# CSS

css * ff:serif p:0.5em ta:center a:center m:auto rd:2px
css .self w:50% p:0 25% h:100% pos:fixed
css h1 ff:Garamond,serif ta:center
css p ta:center
css .divider w:20% bdb:thin solid grey h:5px
css .container d:flex fld:column
	* m:.25em a:center ta:left
css .row d:flex fld:row w:50%
	.label flg:100 ta:left
	input flg:100 ta:cener
css [type="range"] w:30
css button,input d:block bd:thin solid grey
css .out min-height:200px bd:thick solid grey d:flex fld:column jc:end bs:ridge
css .out-block m:0 auto flg:100
css .clipboard m:0 auto


css .dark c:warmer2 bgc:warmer9
	input bgc:warmer9 c:warmer2
css .light c:warmer9 bgc:warmer3
	input bgc:warmer2 c:warmer9


imba.mount <app>

# POST-MOUNT

console.log(ipsum-args)
