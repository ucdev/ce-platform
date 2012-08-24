###
THIS IS HOW TO INIT THE FILTER
# el: ELEMENT PLACEHOLDER
# collection: COLLECTION OF MODELS
# filterOptionField: MODEL ATTRIBUTE THE FILTER WILL USE FOR CLICKABLE OPTIONS
# filterOptions: KEY-VALUE PAIRS, EACH OF WHICH WILL TURN INTO A CLICKABLE LIST ITEM
# typeaheadField: FIELD TO SEARCH FOR VIAT HE TYPEAHEAD VALUE
# typeaheadPlaceholder: PLACEHOLDER TEXT FOR THE TYPEAHEAD

self.filter = new ce.ui.Filter(
    el: "string"
    collection: object
    filterOptionField: "string"
    filterOptions: { "Label": Value, ["Label": Value]... }
    typeaheadField: "string"
    typeaheadPlaceholder: "string"
    ).render()
###

ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Filter = Backbone.View.extend
		template: "ui-filter"

		initialize: ->
			self.on "selected_count_changed row_selected", @getFilterCounts, @
			return
	
		events:
			"click .js-clear-search-filter": "clearSearch"
			"click .js-search-filter-typeahead": "preventClose"
			"keyup .js-search-filter-typeahead": "searchCollection"
			"click .js-filter li.js-filter-option": "filterCollection"
			"click .js-filter li.js-filter-all": "showAll"
			"click .js-filter li.js-filter-selected": "showSelected"

		render: ->
			@$el.empty()
			
			_temp = _.template ce.templates.get @template

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html _temp  @collection.info()

			# PROVIDE A PLACEHOLDER FOR THE TYPEAHEAD
			@$el.find(".js-search-filter-typeahead").attr("placeholder", @options.typeaheadPlaceholder)

			# GET FILTER OPTIONS APPEND LOCATION
			filterOptionContainer = @$el.find(".js-filter-options")

			# BUILD FILTER OPTIONS
			_.forEach @options.filterOptions, (id, label) ->
				# BUILD OPTION
				currFilterOption = "<li class=\"js-filter-option js-filter-option-" + id + "\" id=\"filter" + id + "\"><a href=\"javascript://\"><span class=\"js-filter-option-name\">" + label + "</span> <span class=\"js-filter-option-count\"></span></a></li>"

				# APPEND OPTION
				$(currFilterOption).appendTo filterOptionContainer

			# PROVIDE COUNTS FOR EACH FILTER OPTION
			@getFilterCounts()

			self.trigger "filter_loaded"
			return @el

		# ClEARS THE SEARCH FILTER AND SHOW ALL MODELS
		clearSearch: ->
			# CLEAR FILTER TEXT FIELD AND HIDE THE CLEAR DIV
			@$el.find(".js-search-filter-typeahead").val ""
			@$el.find(".js-clear-search-filter").hide()

			@showAll()
			return

		# UPDATES THE COUNT OF MODELS IN EACH FILTER OPTION
		getFilterCounts: ->
			curr = @
			coll = @collection
			filterByField = @options.filterOptionField
			
			# GET THE FILTER LIST
			filterOptions = @$el.find ".js-filter-option"

			# SET TOTAL COUNT FOR ALL FILTER OPTION
			@$el.find('li.js-filter-all').find('span.js-filter-option-all-count').text "(" + coll.getTotalCount() + ")"
			
			# SET FILTER COUNT FOR EACH FILTER OPTION
			$.each filterOptions, (i, filter) ->
				$filter = $(filter)
				filterByValue = parseInt $(filter).attr('id').replace 'filter', ''

				# SET FILTER COUNT FOR CURRENT FILTER OPTION
				$filter.find('span.js-filter-option-count').text "(" + eval("coll.whereExpanded({" + filterByField + ": " + filterByValue + "})").length + ")"
				return

			@$el.find(".js-filter-option-selected-count").text coll.getSelectedCount()
			return

		# SHOW MODELS BASED ON THE SELECTED FILTER OPTION
		filterCollection: (e) ->
			filterOptionId = $(e.currentTarget).attr('id').replace('filter','')
			filterOptionName = $(e.currentTarget).find('.js-filter-option-name').text()

			@collection.setFilter [@options.filterOptionField], filterOptionId
			@collection.pager()

			@updateFilterLabel filterOptionName
			return

		# PREVENTS THE DROPDOWN MENU FROM CLOSING WHEN THE TEXTBOX FOR NAME FILTER IS CLICKED
		preventClose: (e) ->
			return false

		# SEARCHES THE COLLECTION FOR MATCHES TO THE SEARCH FILTER INPUT
		searchCollection: (e) ->
			if $.inArray(e.keyCode, [32, 13, 16, 17]) != 0

				# GET USER INPUT
				input = @$el.find(".js-search-filter-typeahead")
				filterVal = input.val()
				typeaheadField = @options.typeaheadField

				# DETERMINE IF THE CLEAR FILTER DIV IS SHOWN OR HIDDEN
				if input.val().length > 0
					@$el.find(".js-clear-search-filter").show()

					# FIND MODELS THAT MATCH TO THE SEARCH FILTER
					$.each @collection.origModels, (i, item) ->
						matchFilter = new RegExp(filterVal.replace(/(\S+)/g, (s) ->
										  "\\b" + s + ".*"
										).replace(/\s+/g, ""), "gi")

						matches = matchFilter.exec item.get typeaheadField

						# DETERMINE IF THE ITEM IS A MATCH FOR THE FILTER VALUE
						if matches != null
							# ITEM MATCHES
							item.set "ISFILTERMATCH": true, silent: true
						else
							# ITEM FAILED MATCH
							item.set "ISFILTERMATCH": false, silent: true

					# REVEAL ONLY THE FILTERED ITEMS
					@collection.setFilter ["ISFILTERMATCH"], 'true'

					# CHANGE FILTER LABEL
					@updateFilterLabel "Filtered"
				else
					@$el.find(".js-clear-search-filter").hide()
					@showAll()
			return

		# REVEALS ALL PARTICPANTS
		showAll: ->
			@collection.setFilter ['cid'], ''
			@collection.pager()

			@updateFilterLabel "All"
			return

		# REVEALS ALL MODELS WHO HAVE BEEN CHECKMARKED
		showSelected: ->
			@collection.setFilter ['ISSELECTED'], 'true'
			@collection.pager()

			@updateFilterLabel "Selected"
			return

		# UPDATES THE FILTER NAME LABEL
		updateFilterLabel: (filterName) ->
			@$el.find('.js-filter-option-title').text filterName

			self.trigger "filter_filtered", filterName