ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Filter = Backbone.View.extend
		template: _.template ce.templates.get "activity_participants-filter"

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
			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html @template @collection.info()

			# PROVIDE PARTICIPANT COUNTS FOR EACH STATUS
			@getFilterCounts()

			self.trigger "filter_loaded"
			return @el

		clearAttendeeSearch: ->
			# CLEAR FILTER TEXT FIELD AND HIDE THE CLEAR DIV
			@$el.find(".js-attendee-search-typeahead").val ""
			@$el.find(".js-clear-attendee-search").hide()

			@showAll()
			return

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

			copyOfCollection.setFilter ['ISSELECTED'], 'true'
			@$el.find(".js-attendee-status-selected-count").text copyOfCollection.information.totalRecords
			return

		# SHOW ATTENDEES BASED ON THE SELECTED FILTER
		filteredAttendeeStatus: (e) ->
			filterStatusId = $(e.currentTarget).attr('id').replace('status','')
			filterStatusName = $(e.currentTarget).find('.js-attendee-status-name').text()

			@collection.setFilter ['STATUSID'], filterStatusId
			@collection.pager()

			@updateFilterLabel filterStatusName
			return

		keepTypeaheadOpen: (e) ->
			e.preventDefault()
			return false

		searchAttendeeList: (e) ->
			if $.inArray(e.keyCode, [32, 13, 16, 17]) != 0
				console.dir e
				input = @$el.find(".js-attendee-search-typeahead")
				filterVal = input.val().toUpperCase().split(" ")

				# DETERMINE IF THE CLEAR FILTER DIV IS SHOWN OR HIDDEN
				if input.val().length > 0
					@$el.find(".js-clear-attendee-search").show()

					# FIND ATTENDEES MATCHES TO THE FILTER
					$.each @collection.origModels, (i, item) ->
						firstName = item.get("FIRSTNAME").toUpperCase()
						lastName = item.get("LASTNAME").toUpperCase()

						$(filterVal).each (i, wordToMatch) ->
							if firstName.indexOf(wordToMatch) > -1 || lastName.indexOf(wordToMatch) > -1
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

		showAll: ->
			@collection.setFilter ['STATUSID'], [1,2,3,4]
			@collection.pager()

			@updateFilterLabel "All"

			return

		showSelected: ->
			@collection.setFilter ['ISSELECTED'], 'true'
			@collection.pager()

			@updateFilterLabel "Selected"

			return

		updateFilterLabel: (filterName) ->
			@$el.find('.js-attendee-status-title').text filterName

			self.trigger "participants_filtered", filterName