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

				# Render
				try
					opts.content = eco.render(opts.content or '', templateData)
				catch err
					return err

			# Complete
			return true