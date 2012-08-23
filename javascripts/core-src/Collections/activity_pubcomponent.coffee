#! ce._core.collections.Activity_pubcomponent.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_pubcomponent.coffee = Backbone.Collection.extend
		url: '/activity_pubcomponent.coffee/',
		model: models.Activity_pubcomponent.coffee
,ce._core.models
