#! ce._core.Collections.Activities extends Backbone.Collection */
ce.module "_core.Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.Activities = Backbone.Collection.extend
		url: '/activities/',
		model: ce.Models.Activity
