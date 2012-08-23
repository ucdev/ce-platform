#! ce._core.collections.Project.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Project.coffee = Backbone.Collection.extend
		url: '/project.coffee/',
		model: models.Project.coffee
,ce._core.models
