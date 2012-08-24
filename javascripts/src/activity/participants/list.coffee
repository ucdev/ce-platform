#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
	self.List = Backbone.View.extend
		initialize: ->
			coll = @collection
			coll.on "add", @addOne, @
			coll.on "reset", @addAll, @
			coll.on "remove", @render, @

			ce.ui.on "filter_filtered", @render, @
			
			self.on "pager_next", @render, @
			self.on "pager_prev", @render, @
			self.on "page_loaded", @render, @
			self.on "page_reload", @reload, @

			ce.ui.on "selectallcheckbox_deselectall selectallcheckbox_deselectvisible", @reload, @
			
			coll.fetch
				success:() ->
					coll.pager()
					self.trigger "data_loaded"
					return
				silent: true

			return

		addAll: ->
			@$el.empty()
			
			if typeof self.rows == "undefined"
				self.rows = []
			else
				self.rows = []

			@collection.each @addOne
			return

		addOne: (viewModel) ->
			viewModel.set FULLNAME: viewModel.get("FIRSTNAME") + " " + viewModel.get "LASTNAME"

			row = new self.Row 
				model: viewModel

			self.rows.push row 

			$(".js-attendee-rows").append row.render().el
			
			return

		render: ->
			self.trigger "collection_rendered"

		reload: ->
			@collection.goTo @collection.currentPage
			self.trigger "page_reloaded"
	return
,ce._core.models
	