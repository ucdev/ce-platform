#! ce._core.collections.Sys_addresstype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_addresstype.coffee = Backbone.Collection.extend
		url: '/sys_addresstype.coffee/',
		model: models.Sys_addresstype.coffee
,ce._core.models
