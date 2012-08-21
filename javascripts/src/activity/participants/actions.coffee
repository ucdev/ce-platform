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
			"click .js-unselect-participants": "unselectParticipants"

		# ENABLE THE ACTIONS MENU
		activateMenu: ->
			@$el.find(".js-action-menu-button").removeClass "disabled"
			@$el.find(".js-action-menu-label").removeClass "disabled"

		# UPDATE SELECTED PARTICIPANTS STATUS ID
		changeParticipantStatus: (e) ->
			newStatusId = parseInt e.currentTarget.id.split("-")[2]
			selectedParticipants = @collection.getSelected()

			# LOOP OVER SELECTED PARTICIPANTS
			_.forEach selectedParticipants, (model) ->
				# UPDATE STATUS INFORMATION
				switch newStatusId
					when 1
						model.set
							STATUSID: 1
							ISSTATUS1: true
							ISSTATUS2: false
							ISSTATUS3: false
							ISSTATUS4: false
					when 2
						model.set
							STATUSID: 2
							ISSTATUS1: false
							ISSTATUS2: true
							ISSTATUS3: false
							ISSTATUS4: false
					when 3
						model.set 
							STATUSID: 3
							ISSTATUS1: false
							ISSTATUS2: false
							ISSTATUS3: true
							ISSTATUS4: false
					when 4
						model.set
							STATUSID: 4
							ISSTATUS1: false
							ISSTATUS2: false
							ISSTATUS3: false
							ISSTATUS4: true

				model.save()
				return

			# UPDATE MODEL DATA TO REFLECT CHANGE

			# SAVE MODEL DATA TO DB

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

		unselectParticipants: ->
			selectedParticipants = @collection.getSelected()

			# LOOP OVER SELECTED MODELS
			_.forEach selectedParticipants, (model) ->
				# SET ISSELECTED AS FALSE
				model.set ISSELECTED: false

			ce.ui.trigger "selected_count_changed"
			return

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