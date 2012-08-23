#! ce._core.collections.Activity_finbudget.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_finbudget.coffee = Backbone.Collection.extend
		url: '/activity_finbudget.coffee/',
		model: models.Activity_finbudget.coffee
,ce._core.models
