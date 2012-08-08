ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Row = Backbone.View.extend
		tagName: "tr"
		className: "personRow AllAttendees js-all-attendee"
		template: _.template ce.templates.get "activity_participants-row"

		events:
			"click .js-edit-status-date": "revealStatusDateEditor"
			"click .js-cancel-edit-date": "hideStatusDateEditor"
			"change .js-participant-checkbox": "selectAttendee"
			"click .js-save-edited-date": "saveEditedStatusDate"
			"click .js-view-attendee-status-info": "updateViewAttendeeStatuses"

		hideStatusDateEditor: ->
			# SWAP OUT THE EDITOR FOR THE VIEW
			@$el.find(".js-edit-attendee-date").hide()
			@$el.find(".js-view-attendee-date").show()
			return

		render: ->
			@$el.empty()

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.append @template @model.toJSON()
			return @

		revealStatusDateEditor: ->
			# FILL IN THE EDITOR DATE FIELD
			@$el.find(".js-edit-date-field").val(@$el.find(".js-hidden-current-attendee-date").val())

			# SWAP OUT THE VIEW FOR THE EDITOR
			@$el.find(".js-view-attendee-date").hide()
			@$el.find(".js-edit-attendee-date").show()
			return

		saveEditedStatusDate: ->
			row = @
			dateVal = @$el.find(".js-edit-date-field").val()
			statusVal = @$el.find(".js-hidden-current-attendee-status").val()

			$.ajax
				url: "/ajax_adm_activity/saveAttendeeDate"
				type: "post"
				data:
					attendeeId: @model.get "ATTENDEEID"
					dateValue: dateVal
					type: statusVal
				dataType: "json"
				success: (data) ->
					if data.STATUS
						row.render()
						return
			return

		selectAttendee: ->
			# DETERMINE IF THE ROW IS CHECKED
			if $(".js-participant-checkbox").is(":checked")
				# ADD SELECTED CLASS
				@$el.addClass "alert-info"

				# SETS SELECTED PROPERTY TO TRUE
				@.model.set("ISSELECTED", true)
			else
				@$el.removeClass "alert-info"

				# SETS SELECTED PROPERTY TO FALSE
				@.model.set("ISSELECTED", false)
			return

		updateViewAttendeeStatuses: ->
			# CREATE VARIABLES FOR AJAX CALL
			container = @$el.find(".js-current-view-status-date")
			dateType = $(arguments[0].currentTarget).attr("id").split("-")[1]
			hiddenDateContainer = @$el.find(".js-hidden-current-attendee-date")
			hiddenStatusContainer = @$el.find(".js-hidden-current-attendee-status")

			# HIDE THE BUTTON GROUP CONTAINING THE STATUS DATE VIEWER
			container.parent().hide()

			# PULL REQUESTED STATUS DATE
			$.ajax
				url: "/ajax_adm_activity/getAttendeeDate"
				type: "post"
				data:
					attendeeId: @model.get "ATTENDEEID"
					type: dateType
				dataType: "json"
				success: (data) ->
					# DETERMINE IF THE CALL WAS SUCCESSFUL
					if data.STATUS
						# UPDATE THE VIEWABLE DATE
						container.html data.STATUSMSG

						# UPDATE THE HIDDEN FIELD VALUES
						hiddenDateContainer.val data.PAYLOAD.month + "/" + data.PAYLOAD.day + "/" + data.PAYLOAD.year

						if dateType == 2
							hiddenStatusContainer.val 3
						else
							hiddenStatusContainer.val dateType

						self.trigger "viewable_participant_date_changed"

					# REVEAL THE BUTTON GROUP CONTAINING THE STATUS DATE VIEWER
					container.parent().show()
					return
				
			return