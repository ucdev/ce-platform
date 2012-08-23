#! ce._core.collections.Stat_entry.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Stat_entry.coffee = Backbone.Collection.extend
		url: '/stat_entry.coffee/',
		model: models.Stat_entry.coffee
,ce._core.models
