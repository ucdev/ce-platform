ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Pager = Backbone.View.extend
		pagingTemplate: _.template ce.templates.get "ui-pager"

		initialize: ->
			@collection.on "change", @render, this
			@collection.on "reset", @render, this
			return

		events:
			"click a.js-next-page": "nextPage"
			"click a.js-page": "selectPage"
			"click a.js-prev-page": "prevPage"

		render: ->
			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.html @pagingTemplate @collection.info()
			self.trigger "pager_loaded"
			return @el

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