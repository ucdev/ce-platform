ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
    self.Row = Backbone.View.extend
        initialize: ->
            @model.on "change:ISSELECTED", @selectRow, @

        tagName: "tr"
        className: "personRow AllAttendees js-all-attendee"
        template: "activity_participants-row"

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
                parentModel: @model
                ).render()

            return

        events:
            "change .js-participant-checkbox": "selectRow"
            "click .js-delete-link": "deleteRow"

        deleteRow: ->

        render: ->
            @$el.empty()

            _temp = _.template ce.templates.get @template

            # RENDER TEMPLATE AND USE AS PAGE HTML
            @$el.append _temp @model.toJSON()

            # DETERMINE IF THE ROW IS SELECTED
            if @model.get "ISSELECTED"
                @markSelected()

            # ADD EXTRA VIEWS
            @bindViews()
            return @

        selectRow: (e) ->
            # DETERMINE IF THE ROW IS CHECKED
            if @$el.find(".js-participant-checkbox").is ":checked"
                # ADD SELECTED CLASS
                @$el.addClass "alert-info"

                # SETS SELECTED PROPERTY TO TRUE
                @model.set "ISSELECTED": true, silent: true
            else
                @$el.removeClass "alert-info"

                # SETS SELECTED PROPERTY TO FALSE
                @model.set "ISSELECTED": false, silent: true

            self.trigger "selected_count_changed"
            return