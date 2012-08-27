#! ce._core.collections.Sys_specialtylms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_specialtylms.coffee = Backbone.Collection.extend
		url: '/sys_specialtylms.coffee/',
		model: models.Sys_specialtylms.coffee
,ce._core.models
