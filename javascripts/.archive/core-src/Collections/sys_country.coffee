#! ce._core.collections.Sys_country.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_country.coffee = Backbone.Collection.extend
		url: '/sys_country.coffee/',
		model: models.Sys_country.coffee
,ce._core.models
