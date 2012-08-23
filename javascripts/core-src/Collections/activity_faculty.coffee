#! ce._core.collections.Activity_faculty.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_faculty.coffee = Backbone.Collection.extend
		url: '/activity_faculty.coffee/',
		model: models.Activity_faculty.coffee
,ce._core.models
