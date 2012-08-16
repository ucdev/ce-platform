ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Filter = Backbone.View.extend
		template: "activity_participants-filter"

		initialize: ->
			self.on "selected_count_changed", @getFilterCounts, @
			return
	
		events:
			"click .js-clear-attendee-search": "clearAttendeeSearch"
			"click .js-attendee-search-typeahead": "keepTypeaheadOpen"
			"keyup .js-attendee-search-typeahead": "searchAttendeeList"
			"click .js-attendees-filter li.js-attendee-status": "filteredAttendeeStatus"
			"click .js-attendees-filter li.js-attendee-status-all": "showAll"
			"click .js-attendees-filter li.js-attendee-status-Selected": "showSelected"

		render: ->
			@$el.empty()
			
			_temp = _.template ce.templates.get @template

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html _temp  @collection.info()

			# PROVIDE PARTICIPANT COUNTS FOR EACH STATUS
			@getFilterCounts()

			self.trigger "filter_loaded"
			return @el

		# ClEARS THE NAME FILTER AND SHOWS ALL PARTICIPANTS
		clearAttendeeSearch: ->
			# CLEAR FILTER TEXT FIELD AND HIDE THE CLEAR DIV
			@$el.find(".js-attendee-search-typeahead").val ""
			@$el.find(".js-clear-attendee-search").hide()

			@showAll()
			return

		# UPDATES THE COUNT OF PARTICIPANTS IN EACH FILTER LI ON THE DROPDOWN
		getFilterCounts: ->
			curr = @
			# GET THE FILTER LIST
			filterOptions = @$el.find '.js-attendee-status'

			# SET TOTAL ATTENDEE COUNT FOR ALL STATUS FILTER
			@$el.find('li.js-attendee-status-all').find('span.js-attendee-status-count').text "(" + @collection.getTotalCount() + ")"

			# SET ATTENDEE COUNT FOR EACH STATUS FILTER
			$.each filterOptions, ->
				# GET STATUS ID
				filterStatus = parseInt $(@).attr('id').replace 'status', ''

				# SET ATTENDEE COUNT FOR CURRENT STATUS
				switch filterStatus
					when 1 then $(@).find('span.js-attendee-status-count').text "(" + curr.collection.getCompleteCount() + ")"
					when 2 then	$(@).find('span.js-attendee-status-count').text "(" + curr.collection.getInProgressCount() + ")"
					when 3 then	$(@).find('span.js-attendee-status-count').text "(" + curr.collection.getRegisterCount() + ")"
					when 4 then	$(@).find('span.js-attendee-status-count').text "(" + curr.collection.getTermCount() + ")"
				return

			@$el.find(".js-attendee-status-selected-count").text @collection.getSelectedCount()
			return

		# SHOW ATTENDEES BASED ON THE SELECTED STATUS FILTER
		filteredAttendeeStatus: (e) ->
			filterStatusId = $(e.currentTarget).attr('id').replace('status','')
			filterStatusName = $(e.currentTarget).find('.js-attendee-status-name').text()

			@collection.setFilter ['STATUSID'], filterStatusId
			@collection.pager()

			@updateFilterLabel filterStatusName
			return

		# PREVENTS THE DROPDOWN MENU FROM CLOSING WHEN THE TEXTBOX FOR NAME FILTER IS CLICKED
		keepTypeaheadOpen: (e) ->
			e.preventDefault()
			return false

		# SEARCHES THE PARTICIPANT COLLECTION FOR MATCHES TO THE USER INPUT
		searchAttendeeList: (e) ->
			if $.inArray(e.keyCode, [32, 13, 16, 17]) != 0

				# GET USER INPUT
				input = @$el.find(".js-attendee-search-typeahead")
				filterVal = input.val()

				# DETERMINE IF THE CLEAR FILTER DIV IS SHOWN OR HIDDEN
				if input.val().length > 0
					@$el.find(".js-clear-attendee-search").show()

					# FIND ATTENDEES MATCHES TO THE FILTER
					$.each @collection.origModels, (i, item) ->
						matchFilter = new RegExp(filterVal.replace(/(\S+)/g, (s) ->
										  "\\b" + s + ".*"
										).replace(/\s+/g, ""), "gi")

						matches = matchFilter.exec item.get "FULLNAME"

						if matches != null
							item.set "ISFILTERMATCH": true, silent: true
						else
							item.set "ISFILTERMATCH": false, silent: true

					@collection.setFilter ['ISFILTERMATCH'], 'true'

					@updateFilterLabel "Filtered"

					# SET CURRENT STATUS TO FILTERED
				else
					@$el.find(".js-clear-attendee-search").hide()
					@showAll()
			return

		# REVEALS ALL PARTICPANTS
		showAll: ->
			@collection.setFilter ['STATUSID'], [1,2,3,4]
			@collection.pager()

			@updateFilterLabel "All"

			return

		# REVEALS ALL PARTICIPANTS WHO HAVE BEEN CHECKMARKED
		showSelected: ->
			@collection.setFilter ['ISSELECTED'], 'true'
			@collection.pager()

			@updateFilterLabel "Selected"

			return

		# UPDATES THE FILTER NAME LABEL
		updateFilterLabel: (filterName) ->
			@$el.find('.js-attendee-status-title').text filterName

			self.trigger "participants_filtered", filterName