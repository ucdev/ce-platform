#! ce.Collections.Assets extends Backbone.Collection */
ce.module "Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.Assets = Backbone.Collection.extend
		url: '/assets/',
		model: ce.Models.Asset
