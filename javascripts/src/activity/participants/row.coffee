ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Row = Backbone.View.extend
		tagName: "tr"
		className: "personRow AllAttendees js-all-attendee"
		template: _.template ce.templates.get "activity_participants-row"
		render: ->
			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.append @template @model.toJSON()
			return @
