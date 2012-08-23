ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Pager = Backbone.View.extend
		pagingTemplate: "ui-pager"
		sortColumn: "FULLNAME"

		initialize: ->
			@collection.on "reset", @render, @
			return

		events:
			"click a.js-next-page": "nextPage"
			"click a.js-page": "selectPage"
			"click a.js-show-page-dropdown": "extendedDropdownFunctionality"
			"click .js-page-sizer": "preventClose"
			"change .js-page-sizer": "changePageSize"
			"click a.js-prev-page": "prevPage"

		render: ->
			@$el.empty()
			
			_temp = _.template ce.templates.get @pagingTemplate

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html _temp @collection.info()

			# PROVIDE THE CURRENT PAGE SIZE VALUE
			@$el.find(".js-page-sizer").val @collection.perPage

			self.trigger "pager_loaded"
			return

		changePageSize: (e) ->
			updatedValue = parseInt e.currentTarget.value

			if typeof updatedValue == "number" && updatedValue != @collection.perPage && updatedValue > 0
				@collection.howManyPer parseInt e.currentTarget.value
				self.trigger "pager_page_size_changed"

			return

		extendedDropdownFunctionality: ->
			$(@$el.find(".js-page-sizer")).focus()
			console.log $(@$el.find(".js-page-sizer"))
			console.log "IN"
			return

		nextPage: (e) ->
			e.preventDefault()
			if @collection.currentPage < @collection.information.totalPages
				@collection.nextPage()
				self.trigger "pager_next"
			return

		preventClose: (e) ->
			return false

		prevPage: (e) ->
			e.preventDefault()
			@collection.previousPage()
			self.trigger "pager_prev"
			return

		selectPage: ->
			pageNo = parseInt($(arguments[0].currentTarget).attr("id").split("-")[1])
			@collection.goTo pageNo
			self.trigger "pager_page_selected"
			return
	return