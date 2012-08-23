#! ce._core.collections.Assessanswer.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assessanswer.coffee = Backbone.Collection.extend
		url: '/assessanswer.coffee/',
		model: models.Assessanswer.coffee
,ce._core.models
