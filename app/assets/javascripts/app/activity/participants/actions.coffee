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

            switch newStatusId
                when 1
                    newStatusName = "Complete"
                when 2
                    newStatusName = "In Progress"
                when 3
                    newStatusName = "Registered"
                when 4
                    newStatusName = "Terminated"

            # LOOP OVER SELECTED PARTICIPANTS
            _.forEach selectedParticipants, (model) ->
                # UPDATE STATUS INFORMATION
                model.save(
                        STATUSID: newStatusId
                        NAME: newStatusName
                        ISSELECTED: false
                    success: (obj) ->
                        obj.fetch()
                        self.trigger "participant_status_updated", newStatusName
                        ce.ui.trigger "selected_count_changed"
                    )
                return
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
                selectedParticipants = @collection.getSelected()
                
                _.forEach selectedParticipants, (model) -> 
                    model.destroy
                        wait: true
                        success: (model) ->
                            return


                self.trigger "participants_removed", selectedParticipants
                ce.ui.trigger "selected_count_changed"

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