#! ce._core.collections.Activity_site.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_site.coffee = Backbone.Collection.extend
		url: '/activity_site.coffee/',
		model: models.Activity_site.coffee
,ce._core.models
