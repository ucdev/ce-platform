#! ce._core.collections.Sys_emailstyle.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_emailstyle.coffee = Backbone.Collection.extend
		url: '/sys_emailstyle.coffee/',
		model: models.Sys_emailstyle.coffee
,ce._core.models
