#! ce._core.collections.Activity_finledger.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_finledger.coffee = Backbone.Collection.extend
		url: '/activity_finledger.coffee/',
		model: models.Activity_finledger.coffee
,ce._core.models
