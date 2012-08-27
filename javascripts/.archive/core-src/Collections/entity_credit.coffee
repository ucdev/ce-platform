#! ce._core.collections.Entity_credit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_credit.coffee = Backbone.Collection.extend
		url: '/entity_credit.coffee/',
		model: models.Entity_credit.coffee
,ce._core.models
