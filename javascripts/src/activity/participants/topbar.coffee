#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Topbar = Backbone.View.extend
		template:  "activity_participants-topbar"
		render: ->
			_temp = _.template ce.templates.get @template

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _temp

			self.trigger "topbar_loaded"
			return