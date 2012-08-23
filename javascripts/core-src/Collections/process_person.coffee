#! ce._core.collections.Process_person.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Process_person.coffee = Backbone.Collection.extend
		url: '/process_person.coffee/',
		model: models.Process_person.coffee
,ce._core.models
