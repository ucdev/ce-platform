ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
    self.Row = Backbone.View.extend
        initialize: ->
            @model.on "change:ISSELECTED", @determineSelectedStatus, @
            @model.on "change:FIRSTNAME change:LASTNAME", @setFullName, @

            self.on "participant_reset participant_md_toggled participant_status_updated", @render, @
            self.on "participant_removed", @remove, @

            return

        tagName: "tr"
        className: "personRow AllAttendees js-all-attendee"
        template: "activity_participants-row"

        # BIND EXTRANEOUS VIEWS THAT ARE CONTAINED WITHIN THE ROW
        bindViews: ->
            # ESTABLISHES THE STATUSDATE VIEW
            statusDateEl = @$el.find ".js-status-date"
            attributesToPass = 
                ID: @model.get "ID"
                STATUSID: @model.get "STATUSID"
                PARENTSTATUSID: @model.get "STATUSID"
                COMPLETEDATE: Date(@model.get "COMPLETEDATE")
                STATUSNAME: @model.get "NAME"
                REGISTERDATE: Date(@model.get "REGISTERDATE")
                TERMDATE: Date(@model.get "TERMDATE")

            # REMOVED TO SIMPLIFY ACTIVITY PARTICIPANTS || 8/23/12 JS
            # @statusDate = new self.StatusDate(
            #     el: statusDateEl
            #     model: new self.StatusDateModel attributesToPass
            #     parentModel: @model
            #     ).render()

            return

        events:
            "click .js-delete-link": "deleteRow"
            "change .js-participant-checkbox": "selectRow"
            "click .js-print-cme": "printCME"
            "click .js-print-cne": "printCNE"
            "click .js-remove-user": "removeUser"
            "click .js-reset-user": "resetUser"
            "click .js-toggle-md": "toggleMD"

        # USED WHEN SELECTED FROM AN OUTSIDE ENTITY
        determineSelectedStatus: ->
            if @model.get "ISSELECTED"
                @markSelected()
            else
                @markUnselected()
            return

        # DELETES MODEL AND ROW FROM COLLECTION
        deleteRow: ->
            model.destroy
                wait: true
                success: (model) ->
                    return

            self.trigger "participant_removed"
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

        printCME: ->
            self.certContainer.empty()

            certContent = $.ajax
                url: "/reports/cmecert"
                type: "post"
                data:
                    selectedattendees: @model.id
                dataType: "json"
                success: (data) ->
                    self.certContainer.html data 
                    return
                error: ->
                    self.certContainer.html "FUCK SAKE, MATE"
                    return

            self.certContainer.dialog "show"
            return

        printCNE: ->
            self.certContainer.empty()

            certContent = $.ajax
                url: "/reports/cnecert"
                type: "post"
                data:
                    selectedattendees: @model.id
                dataType: "json"
                success: (data) ->
                    self.certContainer.html data 
                    return
                error: ->
                    self.certContainer.html "FUCK SAKE, MATE"
                    return

            self.certContainer.dialog "show"
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
            curr = @
            if confirm "Are you sure you want to remove " + @model.get("FIRSTNAME") + " " + @model.get("LASTNAME") + " from the activity?"
                @model.destroy
                    wait: true
                    success: (model) ->
                        self.trigger "participant_removed", model
                        return

            return

        resetUser: ->
            # CONFIRM THE RESETTING OF THE PARTICIPANT
            if confirm "Are you sure you want to reset the participant information for " + @model.get("FIRSTNAME") + " " + @model.get "LASTNAME"
                # RESET VALUES TO REPRESENT INITIAL DATA
                updatedValues = 
                    NAME: "Registered"
                    STATUSID: 3
                    COMPLETEDATE: ""
                    TERMDATE: ""

                # DETERMINE IF THE PAYMENT INFO SHOULD ALSO BE RESET
                if confirm "Do you want to clear all payment information regarding " + @model.get("FIRSTNAME") + " " + @model.get("LASTNAME") + " for this activity?"
                    # ADD PAYMENT INFORMATION VALUES TO THE RESET VALUES LIST
                    updatedValues.PAYMENTFLAG = "N"
                    updatedValues.PAYMENTAMOUNT = ""
                    updatedValues.PAYORDERNO = ""
                    updatedValues.PAYMENTDATE = ""
                
                # SAVE THE RESET TO THE DB
                @model.save(
                    updatedValues
                    success: ->
                        self.trigger "participant_reset"
                    )

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

                if typeof @model.collection.filterFields != "undefined"
                    if @model.collection.filterFields[0] == "ISSELECTED"
                        self.trigger "page_reload"

            ce.ui.trigger "row_selected"
            return

        setFullName: ->
            @model.set "FULLNAME": @model.get("FIRSTNAME") + " " + @model.get "LASTNAME"
            return

        toggleMD: ->
            curr = @
            if @model.get("MDFLAG").toUpperCase() == "Y"
                newMDFlag = "N"
            else
                newMDFlag = "Y"

            @model.save(
                { MDFLAG: newMDFlag }
                success: ->
                    self.trigger "participant_md_toggled"
                )

            return