ce.module "wheels", (self, ce, Backbone, Marionette, $, _) ->
	self.go = (params) ->
		defaults = 
			pjax: true
			container: ".contentArea"
		
		settings = $.extend({},defaults,params)

		if ce.isBlank(settings.pjax)
			throw "argument 'pjax' should be set to a boolean or excluded completely"

		if settings.pjax and ce.isBlank settings.container
			throw "argument 'container' is required if 'pjax' = true"

		if settings.pjax is true
			$.pjax
				'url':settings.url
				'container':settings.container

			return false
		else
			window.location settings.url
  	return