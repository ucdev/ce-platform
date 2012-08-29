ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.on "filter_filtered", (name) ->
		ce.log.info "filter: filtered by " + name
		return

	self.on "filter_loaded", ->
		ce.log.info "filter: loaded"
		return
	return