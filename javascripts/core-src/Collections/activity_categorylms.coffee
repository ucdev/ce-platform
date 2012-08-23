#! ce._core.collections.Activity_categorylms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_categorylms.coffee = Backbone.Collection.extend
		url: '/activity_categorylms.coffee/',
		model: models.Activity_categorylms.coffee
,ce._core.models
