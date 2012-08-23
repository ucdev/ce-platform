ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models, pagers) ->
    self.load = (params) ->
        self.details =
            activityId: ce.activity.model.get("id")
            AddlAttendees: params.legacy.AddlAttendees
            currAttendee: params.legacy.currAttendee
            currPerson: params.legacy.currPerson
            MaxRegistrants: params.legacy.MaxRegistrants
            NoChange: params.legacy.NoChange
            nPageNo: params.legacy.nPageNo
            nStatus: params.legacy.nStatus
            selectedRows: params.legacy.selectedRows
            selectedCount: params.legacy.selectedCount
            totalAttendeeList: params.legacy.totalAttendeeList
            rowsPerPage: params.legacy.rowsPerPage
            totalPages: params.legacy.totalPages

        
        # MODIFY CLIENT PAGER
        self.paginatorCollection = pagers.clientActivity_participants.extend
            server_api:
                "$format": "json"
                "$top": ->
                    @totalPages * @perPage
                    return
                "key": self.details.activityId
                "orderby": "fullName"
                "$skip": ->
                    @totalPages * @perPage
                    return
            paginator_ui:
                "firstPage": 1
                "currentPage": self.details.nPageNo
                "perPage": 15
            getCompleteCount: ->
                return @whereExpanded(STATUSID: 1).length
            getFilteredCount: ->
                return @sortedAndFilteredModels.length
            getInProgressCount: ->
                return @whereExpanded(STATUSID: 2).length
            getRegisterCount: ->
                return @whereExpanded(STATUSID: 3).length
            getSelected: ->
                return @whereExpanded(ISSELECTED: true)
            getSelectedCount: ->
                return @whereExpanded(ISSELECTED: true).length
            getTermCount: ->
                return @whereExpanded(STATUSID: 4).length
            getTotalCount: ->
                return @information.totalUnfilteredRecords
                
        models.Activity_participant.prototype.idAttribute = "ID"
        
        # CREATE COLLECTION
        self.collection = new self.paginatorCollection
        self.certContainer = $(".js-cert-container").dialog()

        # PROVIDE MODEL REMOVING FUNCTIONALITY TO COLLECTIOn
        self.on "participant_removed participants_removed", (models) ->
            _.forEach models, (model) ->
                # REMOVE THE MODEL FROM THE FULL MODELS LIST
                self.collection.origModels.splice self.collection.origModels.indexOf(model), 1
                return

            # RELOAD THE PAGE
            self.collection.goTo self.collection.currentPage
            return

        self.StatusDateModel = models.Activity_participant.extend
            url: "/ajax_adm_activity/saveAttendeeDate"

        # BUILD TOP BUTTON TOOLBAR
        self.topbar = new self.Topbar(el: ".js-top-bar").render()

        # BUILD BOTTOM BUTTON TOOLBAR
        self.bottombar = new self.Bottombar(el: ".js-bottom-bar").render()

        # INIT LOADER
        self.loader = new ce.ui.Loader
            el: "#tier3"

        # REVEAL LOADER
        self.loader.start()
        
        # BUILD PAGER AND FILTER
        self.on "data_loaded", -> # EVENT BOUND TO BE CALLED AFTER THE COLLECTION FETCH IS SUCCESSFUL
            # REMOVE LOADER
            self.loader.stop()

            self.adder = new self.Adder(
                el: ".js-add-participant"
                collection: self.collection
                defaults: 
                    ID: 0
                    COMPLETEDATE: ""
                    FIRSTNAME: ""
                    LASTNAME: ""
                    NAME: ""
                    MDFLAG: "N"
                    PERSONID: 0
                    REGISTERDATE: ""
                    STATUSID: 3
                    TERMDATE: ""
                ).render()

            self.printer = new self.Printer(
                el: ".js-printer"
                collection: self.collection
                ).render()

            self.actions = new self.Actions(
                el: ".js-partic-actions"
                collection: self.collection
                ).render()

            self.filter = new self.Filter(
                el: ".js-attendee-filter"
                collection: self.collection
                ).render()

            self.pager = new ce.ui.Pager(
                el: ".js-pager-container"
                collection: self.collection
                ).render()
            return
        
        # BUILD PAGE VIEW AND RENDER IT
        self.list = new self.List
            el: ".js-attendee-rows"
            collection: self.collection
        
        # BUILD SELECT ALL CHECK BOX
        self.selectall = new ce.ui.SelectAllCheckBox(
            el: ".js-selectall-placeholder"
            collection: self.collection
            ).render()
        
        # TRIGGER PAGE LOADED EVENT
        self.trigger "page_loaded"
        return
,ce._core.models
,ce._core.pagers