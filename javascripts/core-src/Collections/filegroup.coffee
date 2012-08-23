#! ce._core.collections.Filegroup.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Filegroup.coffee = Backbone.Collection.extend
		url: '/filegroup.coffee/',
		model: models.Filegroup.coffee
,ce._core.models
