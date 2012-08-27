#! ce._core.collections.Sys_categorylms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_categorylms.coffee = Backbone.Collection.extend
		url: '/sys_categorylms.coffee/',
		model: models.Sys_categorylms.coffee
,ce._core.models
