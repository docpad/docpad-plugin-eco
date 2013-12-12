# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class EcoPlugin extends BasePlugin
		# Plugin name
		name: 'eco'

		# Render some content
		render: (opts) ->
			# Prepare
			{inExtension,templateData} = opts

			# Check extensions
			if inExtension is 'eco'
				# Requires
				eco = require('eco')

				if opts.outExtension in ['js']
					# Compile template into JavaScript functions
					output = eco.compile(opts.content,'')
					output = "window.JST['#{opts.file.get('relativeOutPath')}'] = #{output}\n"
					opts.content = "if (!window.JST) {\n  window.JST = {};\n}\n#{output}\n"
				else
					# Render
					opts.content = eco.render(opts.content,templateData)
