#! ce._core.collections.Activity_application.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_application.coffee = Backbone.Collection.extend
		url: '/activity_application.coffee/',
		model: models.Activity_application.coffee
,ce._core.models
