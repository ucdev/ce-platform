#! ce._core.collections.Activity_specialtylms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_specialtylms.coffee = Backbone.Collection.extend
		url: '/activity_specialtylms.coffee/',
		model: models.Activity_specialtylms.coffee
,ce._core.models
