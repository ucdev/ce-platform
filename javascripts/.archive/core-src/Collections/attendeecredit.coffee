#! ce._core.collections.Attendeecredit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendeecredit.coffee = Backbone.Collection.extend
		url: '/attendeecredit.coffee/',
		model: models.Attendeecredit.coffee
,ce._core.models
