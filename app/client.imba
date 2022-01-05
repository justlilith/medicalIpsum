import * as Constants from '$lib/constants'
import * as Helpers from '$lib/helpers'
import '$lib/tags/theme-switch.imba'

let state = {
	dark-mode\boolean : true
	theme\string: 'dark'
	scholarMode\string: 'disabled'
	} # using number as a bool here because range input

let ipsum-args = {
	medAmount\number
	, length\number
}
let out-block\string = ""

console.log("MI [i]: Now running . . .")


const flipMode = do(input)
	console.log input
	const test =
		switch input
			when 'enabled'
				'disabled'
			when 'disabled'
				'enabled'
	console.log test
	test

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
				<input.{state.theme}.sentences type="number" bind=ipsum-args.length data="19">
			# <div.row>
			# 	<label.label> "Scholar mode?"
			# 	if state.scholarMode.toLowerCase! == `enabled`
			# 		<button.enabled.scholar-button @click.prevent=(do (state.scholarMode = flipMode(state.scholarMode)))> "Enabled"
			# 	else
			# 		<button.disabled.scholar-button @click.prevent=(do (state.scholarMode = flipMode(state.scholarMode)))> "Disabled"
			<button.{state.theme} @click.prevent=(do (out-block = await Helpers.generateIpsum {...ipsum-args, scholarMode:state.scholarMode}))> "Generate ipsum, stat!"
		<section>
			<section.out>
				<p.out-block> out-block
				<button.{state.theme}.clipboard @click.prevent=(do Helpers.copyToClipboard out-block)> "Copy to clipboard"

# CSS

css * ff:serif p:0.5em ta:center a:center m:auto rd:2px
css .self w:50% p:0 25% min-height:100vh pos:relative
css h1 ff:Garamond,serif ta:center
css p ta:center
css .divider w:20% bdb:thin solid grey h:5px
css .container d:flex fld:column
	* m:.25em a:center ta:left
css .row d:flex fld:row w:50%
	.label flg:100 ta:left
	input ta:center
css .sentences w:30
css .scholar w:20px
css .scholar-button bd:none
css .scholar-button.enabled bgc:green4 c:green9
css .scholar-button.disabled bgc:red9 c:red2
css .disbled bgc:red4 c:red9
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
