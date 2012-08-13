ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.StatusDate = Backbone.View.extend
		template: _.template ce.templates.get "activity_participants-statusdate"
		initialize: ->
			@model.on "change", @render, @

			return

		model: self.StatusDateModel

		events:
			"click .js-edit-status-date": "revealStatusDateEditor"
			"click .js-cancel-edit-date": "hideStatusDateEditor"
			"click .js-save-edited-date": "saveEditedStatusDate"
			"click .js-view-attendee-status-info": "updateViewAttendeeStatuses"

		render: ->
			@$el.empty()

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html @template @model.toJSON()

			#MASK THE EDIT FIELD FOR THE DATE
			@$el.find(".js-edit-date-field").mask "99/99/9999"

			return @

		hideStatusDateEditor: ->
			# SWAP OUT THE EDITOR FOR THE VIEW
			@$el.find(".js-edit-attendee-date").hide()
			@$el.find(".js-view-attendee-date").show()
			return

		revealStatusDateEditor: ->
			# FILL IN THE EDITOR DATE FIELD
			@$el.find(".js-edit-date-field").val(@$el.find(".js-hidden-current-attendee-date").val())

			# SWAP OUT THE VIEW FOR THE EDITOR
			@$el.find(".js-view-attendee-date").hide()
			@$el.find(".js-edit-attendee-date").show()
			return

		saveEditedStatusDate: ->
			Backbone.emulateHTTP = true
			Backbone.emulateJSON = true

			switch @model.get("CURRSTATUSID")
			    when 1
			    	@model.save(CURRSTATUSDATE: @$el.find(".js-edit-date-field").val(),CURRSTATUSID: @$el.find(".js-hidden-current-attendee-status").val(),COMPLETEDATE: @$el.find(".js-edit-date-field").val())
			    	break
			    when 2
			    	@model.save(CURRSTATUSDATE: @$el.find(".js-edit-date-field").val(),CURRSTATUSID: @$el.find(".js-hidden-current-attendee-status").val(),REGISTERDATE: @$el.find(".js-edit-date-field").val())
			    	break
			    when 3
			    	@model.save(CURRSTATUSDATE: @$el.find(".js-edit-date-field").val(),CURRSTATUSID: @$el.find(".js-hidden-current-attendee-status").val(),REGISTERDATE: @$el.find(".js-edit-date-field").val())
			    	break
			    when 4
			    	@model.save(CURRSTATUSDATE: @$el.find(".js-edit-date-field").val(),CURRSTATUSID: @$el.find(".js-hidden-current-attendee-status").val(),TERMDATE: @$el.find(".js-edit-date-field").val())
			    	break

			return

		updateViewAttendeeStatuses: ->
			curr = @
			container = @$el.find(".js-current-view-status-date")

			# UPDATE MODEL INFO
			@model.set
				CURRSTATUSID: $(arguments[0].currentTarget).attr("id").split("-")[1]

			# HIDE THE BUTTON GROUP CONTAINING THE STATUS DATE VIEWER
			container.parent().hide()

			@render()
				
			return