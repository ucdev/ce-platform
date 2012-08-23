#! ce._core.collections.Sys_entrytype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_entrytype.coffee = Backbone.Collection.extend
		url: '/sys_entrytype.coffee/',
		model: models.Sys_entrytype.coffee
,ce._core.models
