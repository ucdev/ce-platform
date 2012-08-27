#! ce._core.collections.Sys_attendeestatus.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_attendeestatus.coffee = Backbone.Collection.extend
		url: '/sys_attendeestatus.coffee/',
		model: models.Sys_attendeestatus.coffee
,ce._core.models
