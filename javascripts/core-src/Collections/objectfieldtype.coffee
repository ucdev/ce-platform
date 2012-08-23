#! ce._core.collections.Objectfieldtype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Objectfieldtype.coffee = Backbone.Collection.extend
		url: '/objectfieldtype.coffee/',
		model: models.Objectfieldtype.coffee
,ce._core.models
