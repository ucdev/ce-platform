#! ce._core.collections.Sys_assessquestiontype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_assessquestiontype.coffee = Backbone.Collection.extend
		url: '/sys_assessquestiontype.coffee/',
		model: models.Sys_assessquestiontype.coffee
,ce._core.models
