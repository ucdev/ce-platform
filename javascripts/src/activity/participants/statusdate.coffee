ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.StatusDate = Backbone.View.extend
		template: "activity_participants-statusdate"
		initialize: ->
			@model.on "change", @render, @
			#@model.on "change:CURRSTATUSID", @updateParentModel, @

			return

		model: self.StatusDateModel

		events:
			"click .js-edit-status-date": "revealStatusDateEditor"
			"click .js-cancel-edit-date": "hideStatusDateEditor"
			"click .js-save-edited-date": "saveEditedStatusDate"
			"click .js-view-attendee-status-info": "updateViewAttendeeStatuses"

		render: ->
			@$el.empty()

			_temp = _.template ce.templates.get @template

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.html _temp @model.toJSON()

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
			Backbone.emulateJSON = true
			switch @model.get("CURRSTATUSID")
			    when 1
			    	@model.save
			    		CURRSTATUSDATE: @$el.find(".js-edit-date-field").val()
			    		CURRSTATUSID: @model.get("CURRSTATUSID")
			    		COMPLETEDATE: @$el.find(".js-edit-date-field").val()
			    	break
			    when 2
			    	@model.save
			    		CURRSTATUSDATE: @$el.find(".js-edit-date-field").val()
			    		CURRSTATUSID: @model.get("CURRSTATUSID")
			    		REGISTERDATE: @$el.find(".js-edit-date-field").val()
			    	break
			    when 3
			    	@model.save
			    		CURRSTATUSDATE: @$el.find(".js-edit-date-field").val()
			    		CURRSTATUSID: @model.get("CURRSTATUSID")
			    		REGISTERDATE: @$el.find(".js-edit-date-field").val()
			    	break
			    when 4
			    	@model.save
			    		CURRSTATUSDATE: @$el.find(".js-edit-date-field").val()
			    		CURRSTATUSID: @model.get("CURRSTATUSID")
			    		TERMDATE: @$el.find(".js-edit-date-field").val()
			    	break
			return

		# KEEPS PARENT MODEL UP TO DATE
		updateParentModel: ->
			@options.parentModel.set @model.attributes

			return

		updateViewAttendeeStatuses: ->
			container = @$el.find(".js-current-view-status-date")

			# UPDATE MODEL INFO
			@model.set
				STATUSID: parseInt $(arguments[0].currentTarget).attr("id").split("-")[1]

			return