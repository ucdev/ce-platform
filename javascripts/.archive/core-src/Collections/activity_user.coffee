#! ce._core.collections.Activity_user.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_user.coffee = Backbone.Collection.extend
		url: '/activity_user.coffee/',
		model: models.Activity_user.coffee
,ce._core.models
