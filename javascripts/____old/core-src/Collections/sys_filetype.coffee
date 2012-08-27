#! ce._core.collections.Sys_filetype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_filetype.coffee = Backbone.Collection.extend
		url: '/sys_filetype.coffee/',
		model: models.Sys_filetype.coffee
,ce._core.models
