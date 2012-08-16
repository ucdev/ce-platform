ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Actions = Backbone.View.extend
		template: "activity_participants-actions"

		initialize: ->
			self.on "selected_count_changed", @updateSelectedCount, @
			return

		# events:
		#     "change .js-participant-checkbox": "selectAttendee"
		#     "click .js-delete-link": "deleteRow"

		activateMenu: ->
			@$el.find(".js-action-menu-button").removeClass "disabled"
			@$el.find(".js-action-menu-label").removeClass "disabled"

		deactivateMenu: ->
			@$el.find(".js-action-menu-button").addClass "disabled"
			@$el.find(".js-action-menu-label").addClass "disabled"

		render: ->
			@$el.empty()

			_temp = _.template ce.templates.get @template

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _temp

			return @

		updateSelectedCount: ->
			# GET THE SELECTED COUNT
			selectedCount = @collection.getSelectedCount()

			# UPDATE THE SELECTED COUNT
			@$el.find(".js-attendee-status-selected-count").text selectedCount

			if selectedCount > 0
				@activateMenu()
			else
				@deactivateMenu()

			return