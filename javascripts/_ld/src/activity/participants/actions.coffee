ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Actions = Backbone.View.extend
		template: "activity_participants-actions"

		initialize: ->
			ce.ui.on "selected_count_changed", @updateSelectedCount, @
			self.on "row_selected", @updateSelectedCount, @
			return

		events:
			"click .js-change-status": "changeParticipantStatus"
			"click .js-print-certificate": "printCertificate"
			"click .js-remove-participants": "removeParticipants"

		# ENABLE THE ACTIONS MENU
		activateMenu: ->
			@$el.find(".js-action-menu-button").removeClass "disabled"
			@$el.find(".js-action-menu-label").removeClass "disabled"

		# UPDATE SELECTED PARTICIPANTS STATUS ID
		changeParticipantStatus: (e) ->
			newStatusId = e.currentTarget.id.split("-")[2]
			
			self.trigger "actions_status_changed"
			return

		# DISABLE THE ACTIONS MENU
		deactivateMenu: ->
			@$el.find(".js-action-menu-button").addClass "disabled"
			@$el.find(".js-action-menu-label").addClass "disabled"
			return

		# PRINT CERTIFICATES FOR SELECTED PARTICIPANTS
		printCertificate: (e) ->
			certType = e.currentTarget.id.split("-")[1]
			console.log certType
			return

		# REMOVE SELECTED PARTICIPANTS FROM THE ACTIVITY
		removeParticipants: ->
			if confirm "Are you sure you wish to remove " + @collection.getSelectedCount() + " attendees?"
				console.log "Removing attendees..."
			self.trigger "actions_participants_removed"
			return

		render: ->
			@$el.empty()

			_temp = _.template ce.templates.get @template

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _temp

			return @

		# UPDATE THE SELECTED COUNT LABEL WITH THE MOST CURRENT SELECTED PARITCIPANT COUNT
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