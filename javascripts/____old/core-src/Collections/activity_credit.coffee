#! ce._core.collections.Activity_credit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_credit.coffee = Backbone.Collection.extend
		url: '/activity_credit.coffee/',
		model: models.Activity_credit.coffee
,ce._core.models
