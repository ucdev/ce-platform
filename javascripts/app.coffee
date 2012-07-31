Inject.setModuleRoot "/javascripts/app/"
Inject.enableDebug true

#allows you to require jquery modules easily and hides jquery from main scope
Inject.addRule /jquery/,
	path:"vendor/jquery/jquery.js"
	pointcuts:
		after: () ->
			module.setExports jQuery.noConflict
			delete window["jQuery"]
			delete window["$"]

Inject.addRule /jqueryui/,
	path:"vendor/jquery/jquery-ui-1.8.21.custom.min.js"
	pointcuts:
		before: () ->
			jQuery = require "jquery"

Inject.addRule /underscore/,
	path:"vendor/underscore/underscore.js"
	pointcuts:
		after: () ->
			module.setExports _.noConflict
			delete window["_"]

Inject.addRule /backbone/,
	path:"vendor/backbone/backbone.js"
	pointcuts:
		before: () ->
			_ = require "underscore"

require.run "bootloader"

