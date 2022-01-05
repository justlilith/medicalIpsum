import * as Helpers from '$lib/helpers'

tag theme-switch
	# prop dark-mode\boolean # using number as a bool here because range input

	def flipMode
		data.dark-mode = !data.dark-mode
		data.dark-mode ? data.theme = 'dark' : data.theme = 'light'
		console.log data.dark-mode

	# RENDERED

	<self>
		<button @click=(do (flipMode!))> "🌙/☀️"

		css button float:right

# END