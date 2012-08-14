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
				"activityId": self.details.activityId
				"orderby": "fullName"
				"$skip": ->
					@totalPages * @perPage
					return
			paginator_ui:
				"firstPage": 1
				"currentPage": self.details.nPageNo
				"perPage": 15
		
		# CREATE COLLECTION
		self.collection = new self.paginatorCollection

		self.StatusDateModel = models.Activity_participant.extend
			url: "/ajax_adm_activity/saveAttendeeDate"

		# BUILD TOP BUTTON TOOLBAR
		self.topbar = new self.Topbar(el: ".js-top-bar").render()
		
		# BUILD PAGE VIEW AND RENDER IT
		self.list = new self.List
			el: ".js-attendee-rows"
			collection: self.collection

		# BUILD BOTTOM BUTTON TOOLBAR
		self.bottombar = new self.Bottombar(el: ".js-bottom-bar").render()
		
		# BUILD PAGER
		self.on "data_loaded", -> # EVENT BOUND TO BE CALLED AFTER THE COLLECTION FETCH IS SUCCESSFUL
			self.pager = new ce.ui.Pager(
				el: ".js-pager-container"
				collection: self.collection
				).render()

			self.filter = new self.Filter(
				el: ".js-attendee-filter"
				collection: self.collection
				).render()
		
		self.trigger "page_loaded"
		return
,ce._core.models
,ce._core.pagers