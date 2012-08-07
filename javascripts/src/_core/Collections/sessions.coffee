#! ce._core.collections.Sessions extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sessions = Backbone.Collection.extend
		url: '/sessions/',
		model: models.Session
,ce._core.models
