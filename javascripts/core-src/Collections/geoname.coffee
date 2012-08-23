#! ce._core.collections.Geoname.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Geoname.coffee = Backbone.Collection.extend
		url: '/geoname.coffee/',
		model: models.Geoname.coffee
,ce._core.models
