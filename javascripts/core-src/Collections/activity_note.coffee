#! ce._core.collections.Activity_note.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_note.coffee = Backbone.Collection.extend
		url: '/activity_note.coffee/',
		model: models.Activity_note.coffee
,ce._core.models
