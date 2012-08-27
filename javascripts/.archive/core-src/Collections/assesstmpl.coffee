#! ce._core.collections.Assesstmpl.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assesstmpl.coffee = Backbone.Collection.extend
		url: '/assesstmpl.coffee/',
		model: models.Assesstmpl.coffee
,ce._core.models
