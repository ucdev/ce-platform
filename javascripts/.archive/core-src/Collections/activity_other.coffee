#! ce._core.collections.Activity_other.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_other.coffee = Backbone.Collection.extend
		url: '/activity_other.coffee/',
		model: models.Activity_other.coffee
,ce._core.models
