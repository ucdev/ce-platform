#! ce._core.collections.Sys_testtype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_testtype.coffee = Backbone.Collection.extend
		url: '/sys_testtype.coffee/',
		model: models.Sys_testtype.coffee
,ce._core.models
