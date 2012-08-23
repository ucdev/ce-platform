#! ce._core.collections.Stat_log.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Stat_log.coffee = Backbone.Collection.extend
		url: '/stat_log.coffee/',
		model: models.Stat_log.coffee
,ce._core.models
