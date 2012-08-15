ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Actions = Backbone.View.extend
		template: _.template ce.templates.get "activity_participants-actions"

		initialize: ->
			self.on "selected_count_changed", @updateSelectedCount, @
			return

		# events:
		#     "change .js-participant-checkbox": "selectAttendee"
		#     "click .js-delete-link": "deleteRow"

		render: ->
			@$el.empty()

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html @template

			return @

		updateSelectedCount: ->
			# UPDATE THE SELECTED COUNT
			@$el.find(".js-attendee-status-selected-count").text @collection.getSelectedCount().length
			return