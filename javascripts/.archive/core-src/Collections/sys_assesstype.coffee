#! ce._core.collections.Sys_assesstype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_assesstype.coffee = Backbone.Collection.extend
		url: '/sys_assesstype.coffee/',
		model: models.Sys_assesstype.coffee
,ce._core.models
