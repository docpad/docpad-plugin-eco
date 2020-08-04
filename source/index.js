'use strict'

// Imports
const BasePlugin = require('docpad-baseplugin')
const eco = require('eco')

// Export and Define Plugin
module.exports = class EcoPlugin extends BasePlugin {
	// Plugin name
	get name() {
		return 'eco'
	}

	// Render some content
	render(opts) {
		// Prepare
		const { inExtension, templateData } = opts

		// Check extensions
		if (inExtension === 'eco') {
			// Render
			try {
				opts.content = eco.render(opts.content || '', templateData)
			} catch (err) {
				return err
			}
		}

		// Complete
		return true
	}
}
