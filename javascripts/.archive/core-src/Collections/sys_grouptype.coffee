#! ce._core.collections.Sys_grouptype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_grouptype.coffee = Backbone.Collection.extend
		url: '/sys_grouptype.coffee/',
		model: models.Sys_grouptype.coffee
,ce._core.models
