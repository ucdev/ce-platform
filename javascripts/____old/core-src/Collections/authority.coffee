#! ce._core.collections.Authority.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Authority.coffee = Backbone.Collection.extend
		url: '/authority.coffee/',
		model: models.Authority.coffee
,ce._core.models
