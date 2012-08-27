#! ce._core.collections.Objecttype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Objecttype.coffee = Backbone.Collection.extend
		url: '/objecttype.coffee/',
		model: models.Objecttype.coffee
,ce._core.models
