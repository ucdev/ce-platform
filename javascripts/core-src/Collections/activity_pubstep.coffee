#! ce._core.collections.Activity_pubstep.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_pubstep.coffee = Backbone.Collection.extend
		url: '/activity_pubstep.coffee/',
		model: models.Activity_pubstep.coffee
,ce._core.models
