#! ce._core.collections.Sys_ethnicity.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_ethnicity.coffee = Backbone.Collection.extend
		url: '/sys_ethnicity.coffee/',
		model: models.Sys_ethnicity.coffee
,ce._core.models
