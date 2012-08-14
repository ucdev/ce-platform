ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Filter = Backbone.View.extend
		template: _.template ce.templates.get "activity_participants-filter"

		initialize: ->
			#@collection.on "change:ISSELECTED", @getFilterCounts, @
			return
	
		events:
			"click .js-clear-attendee-search": "clearAttendeeSearch"
			"click .js-attendee-search-typeahead": "searchAttendeeList"
			"click .js-attendees-filter li.js-attendee-status": "filteredAttendeeStatus"
			"click .js-attendees-filter li.js-attendee-status-all": "showAll"

		render: ->
			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html @template @collection.info()

			# PROVIDE PARTICIPANT COUNTS FOR EACH STATUS
			@getFilterCounts()

			self.trigger "filter_loaded"
			return @el

		clearAttendeeSearch: ->
			# SHOW ALL ATTENDESS
			participants.pageData.nStatus = 0
			  
			# RELOAD PAGE DATA
			participants.changePage()
			  
			# CLEAR FILTER TEXT FIELD AND HIDE THE CLEAR DIV
			participants.attendeeSearch["input"].val ""
			participants.attendeeSearch["clear"].hide()

		getFilterCounts: ->
			# CLONE THE COLLECTION
			copyOfCollection = _.clone @collection

			# GET THE FILTER LIST
			filterOptions = @$el.find '.js-attendee-status'

			# SET TOTAL ATTENDEE COUNT FOR ALL STATUS FILTER
			@$el.find('li.js-attendee-status-all').find('span.js-attendee-status-count').text "(" + copyOfCollection.information.totalUnfilteredRecords + ")"

			# SET ATTENDEE COUNT FOR EACH STATUS FILTER
			$.each filterOptions, ->
				# GET STATUS ID
				filterStatus = $(@).attr('id').replace 'status', ''
				
				# FILTER THE COLLECTION BY THE STATUS ID
				copyOfCollection.setFilter ['STATUSID'], filterStatus

				# SET ATTENDEE COUNT FOR CURRENT STATUS
				$(@).find('span.js-attendee-status-count').text "(" + copyOfCollection.information.totalRecords + ")"
				return

			copyOfCollection.setFilter({ ISSELECTED: true })
			@$el.find(".js-attendee-status-selected-count").text copyOfCollection.information.totalRecords
			return

		filteredAttendeeStatus: (e) ->
			filterStatusId = $(e.currentTarget).attr('id').replace('status','')
			filterStatusName = $(e.currentTarget).find('.js-attendee-status-name').text()

			@collection.setFilter ['STATUSID'], filterStatusId
			@collection.pager()

			@$el.find('.js-attendee-status-title').text filterStatusName

			return

		searchAttendeeList: ->
			input = $(this)
			statusList = participants.attendeeList.statuses["filtered"].attendees
			  
			# DETERMINE IF THE CLEAR FILTER DIV IS SHOWN OR HIDDEN
			if input.val().length > 0
				participants.attendeeSearch.clear.show()
			else
				participants.attendeeSearch.clear.hide()
			  
			# CLEAR CURRENT FILTER DOM ATTENDEE LIST
			statusList.length = 0
			  
			# CLEAR CURRENT ATTENDEE HTML LIST
			participants.contentContainer.html ""
			  
			# DETERMINE IF SEARCH FILTER IS BLANK
			if input.val().length > 0
				
				# LOOP OVER ATTENDEES
				$.each participants.attendeeList["attendees"], (i, item) ->
					# SEE IF THE FIRST OR LAST NAME STARTS WITH THE SEARCH VALUE AND THAT TEHY ARE NOT ALREADY IN THE FILTER STATUS LIST
					statusList.push item.ATTENDEEID  if (item.FIRSTNAME.startsWith(input.val()) or item.LASTNAME.startsWith(input.val())) and not $.ListFind(statusList, item.ATTENDEEID)

				
				# SET CURRENT STATUS TO FILTERED
				participants.pageData.nStatus = "filtered"
				
				# UPDATE PAGINATOR AND RELOAD HTML
				participants.updatePaginator()
				participants.changePage()

		showAll: ->
			@collection.setFilter ['STATUSID'], [1,2,3,4]
			@collection.pager()

			@$el.find('.js-attendee-status-title').text "All"

			return

		updateSelectedCount: ->
			console.log "in"
			return