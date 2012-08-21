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
			"click a.js-prev-page": "prevPage"

		render: ->
			@$el.empty()

			_temp = _.template ce.templates.get @pagingTemplate

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html _temp @collection.info()

			self.trigger "pager_loaded"
			return

		nextPage: (e) ->
			e.preventDefault()
			if @collection.currentPage < @collection.information.totalPages
				@collection.nextPage()
				self.trigger "pager_next"
			return

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