#! ce._core.collections.Activity_profile.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_profile.coffee = Backbone.Collection.extend
		url: '/activity_profile.coffee/',
		model: models.Activity_profile.coffee
,ce._core.models
