#! ce._core.collections.Entityrole.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entityrole.coffee = Backbone.Collection.extend
		url: '/entityrole.coffee/',
		model: models.Entityrole.coffee
,ce._core.models
