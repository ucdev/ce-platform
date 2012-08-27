#! ce._core.collections.Relicensure.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Relicensure.coffee = Backbone.Collection.extend
		url: '/relicensure.coffee/',
		model: models.Relicensure.coffee
,ce._core.models
