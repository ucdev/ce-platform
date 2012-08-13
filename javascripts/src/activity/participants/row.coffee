ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Row = Backbone.View.extend
		tagName: "tr"
		className: "personRow AllAttendees js-all-attendee"
		template: _.template ce.templates.get "activity_participants-row"

		bindViews: ->
			# ESTABLISHES THE STATUSDATE VIEW
			statusDateEl = @$el.find(".js-status-date")
			attributesToPass = 
				STATUSID: @model.get("STATUSID")
				ATTENDEEID: @model.get("ATTENDEEID")
				COMPLETEDATE: @model.get("COMPLETEDATE")
				CURRSTATUSDATE: @model.get("CURRSTATUSDATE")
				CURRSTATUSID: @model.get("CURRSTATUSID")
				REGISTERDATE: @model.get("REGISTERDATE")
				TERMDATE: @model.get("TERMDATE")

			@statusDate = new self.StatusDate(
			  el: statusDateEl
			  model: new self.StatusDateModel attributesToPass
			  ).render()

			return

		events:
			"change .js-participant-checkbox": "selectAttendee"

		render: ->
			@$el.empty()

			# RENDER TEMPLATE AND USE AS PAGE HTML
			@$el.append @template @model.toJSON()

			# ADD EXTRA VIEWS
			@bindViews()
			return @

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