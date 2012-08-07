ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models, pagers) ->
  self.load = (params) ->
    self.details =
      activityId: ce.activity.model.get "id"
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
    self.paginatorCollection = pagers.Activity_participants.extend
      server_api:
        "$format": "json"
        "$top": ->
          @totalPages * @perPage
        "activityId": self.details.activityId
        "orderby": "fullName"
        "$skip": ->
          @totalPages * @perPage
    
    
    # CREATE COLLECTION
    self.collection = new self.paginatorCollection()

    # BUILD TOP BUTTON TOOLBAR
    self.topbar = new self.Topbar(el: ".js-top-bar").render()
    
    # BUILD PAGE VIEW AND RENDER IT
    self.list = new self.List(
      el: $(".js-registrants-container")
      collection: self.collection
      ).render()

    # BUILD BOTTOM BUTTON TOOLBAR
    self.bottombar = new self.Bottombar(el: ".js-bottom-bar").render()
    
    # BUILD PAGER
    self.on "data_loaded", -> # EVENT BOUND TO BE CALLED AFTER THE DATA FETCH IS SUCCESSFUL
      self.pager = new ce.ui.Pager(
        el: $(".js-pager-container")
        collection: self.collection
        )
      self.pager.render()
      return
    
    # console.dir(self.list);
    # console.dir(self.collection);
    self.trigger "page_loaded"
,ce._core.models
,ce._core.pagers