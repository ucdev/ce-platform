#! ce._core.collections.Grouptype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Grouptype.coffee = Backbone.Collection.extend
		url: '/grouptype.coffee/',
		model: models.Grouptype.coffee
,ce._core.models
