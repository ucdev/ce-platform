#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Bottombar = Backbone.View.extend
		template: "activity_participants-bottombar"
		render: ->
			@$el.empty()

			_temp = ce.templates.get @template

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _.template _temp

			self.trigger "bottombar_loaded"
			return