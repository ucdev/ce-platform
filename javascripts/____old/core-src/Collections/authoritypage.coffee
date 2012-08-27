#! ce._core.collections.Authoritypage.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Authoritypage.coffee = Backbone.Collection.extend
		url: '/authoritypage.coffee/',
		model: models.Authoritypage.coffee
,ce._core.models
