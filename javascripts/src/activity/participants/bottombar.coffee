#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Bottombar = Backbone.View.extend
		template: ce.templates.get "activity_participants-bottombar"
		render: ->
			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _.template @template

			self.trigger "bottombar_loaded"
			return