ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
    self.Row = Backbone.View.extend
        initialize: ->
            @model.on "change:ISSELECTED", @determineSelectedStatus, @
            #self.on "change:ISMD", @toggleMD, @
            return

        tagName: "tr"
        className: "personRow AllAttendees js-all-attendee"
        template: "activity_participants-row"

        # BIND EXTRANEOUS VIEWS THAT ARE CONTAINED WITHIN THE ROW
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
            "click .js-toggle-md": "toggleMD"
            "click .js-remove-user": "removeUser"
            "click .js-reset-user": "resetUser"

        # USED WHEN SELECTED FROM AN OUTSIDE ENTITY
        determineSelectedStatus: ->
            if @model.get "ISSELECTED"
                @markSelected()
            else
                @markUnselected()
            return

        # DELETES MODEL AND ROW FROM COLLECTION
        deleteRow: ->
            return

        # USED WHEN RENDERING THE VIEW TO DiSPLAY IT AS SELECTED OR WHEN BEING MODIFIED FROM OUTSIDE ENTITY
        markSelected: ->
            @$el.find(".js-participant-checkbox").attr "checked", true
            @$el.addClass "alert-info"
            return

        # USED WHEN MODIFIED FROM AN OUTSIDE ENTITY
        markUnselected: ->
            @$el.find(".js-participant-checkbox").attr "checked", false
            @$el.removeClass "alert-info"
            return

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

        removeUser: ->
            @model.destroy()
            self.trigger "participant_removed"
            return

        resetUser: ->
            @render()
            self.trigger "participant_reset"
            return

        # USED WHEN THE INDIVIDUAL ROW IS SELECTED
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

            self.trigger "row_selected"
            return

        toggleMD: ->
            curr = @
            if @model.get "ISMD"
                @model.set 
                    "ISMD": false
                    "MDFLAG": "N"
            else
                @model.set
                    "ISMD": true
                    "MDFLAG": "Y"

            @model.save(
                {}
                success: ->
                    self.trigger "participant_md_toggled"
                    curr.render()
                )

            return