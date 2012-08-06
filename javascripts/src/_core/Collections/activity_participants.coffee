#! ce.Collections.Activity_participants extends Backbone.Collection */
ce.module "Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.Activity_participants = Backbone.Collection.extend
		url: '/activity_participants/',
		model: ce.Models.Activity_participant
