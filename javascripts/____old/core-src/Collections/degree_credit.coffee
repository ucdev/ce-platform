#! ce._core.collections.Degree_credit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Degree_credit.coffee = Backbone.Collection.extend
		url: '/degree_credit.coffee/',
		model: models.Degree_credit.coffee
,ce._core.models
