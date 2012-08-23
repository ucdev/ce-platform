#! ce._core.collections.Activity_finfee.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_finfee.coffee = Backbone.Collection.extend
		url: '/activity_finfee.coffee/',
		model: models.Activity_finfee.coffee
,ce._core.models
