#! ce._core.collections.Assessresult.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assessresult.coffee = Backbone.Collection.extend
		url: '/assessresult.coffee/',
		model: models.Assessresult.coffee
,ce._core.models
