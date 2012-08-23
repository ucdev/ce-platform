#! ce._core.collections.Activity_finsupport.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_finsupport.coffee = Backbone.Collection.extend
		url: '/activity_finsupport.coffee/',
		model: models.Activity_finsupport.coffee
,ce._core.models
