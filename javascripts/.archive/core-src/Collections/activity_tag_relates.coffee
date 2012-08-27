#! ce._core.collections.Activity_tag_relates.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_tag_relates.coffee = Backbone.Collection.extend
		url: '/activity_tag_relates.coffee/',
		model: models.Activity_tag_relates.coffee
,ce._core.models
