#! ce._core.collections.Sys_supporttype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_supporttype.coffee = Backbone.Collection.extend
		url: '/sys_supporttype.coffee/',
		model: models.Sys_supporttype.coffee
,ce._core.models
