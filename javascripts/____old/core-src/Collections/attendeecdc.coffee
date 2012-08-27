#! ce._core.collections.Attendeecdc.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendeecdc.coffee = Backbone.Collection.extend
		url: '/attendeecdc.coffee/',
		model: models.Attendeecdc.coffee
,ce._core.models
