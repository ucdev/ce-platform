#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
	self.List = Backbone.View.extend
		initialize: ->
			coll = @collection
			coll.on "add", @addOne, @
			coll.on "reset", @addAll, @

			self.on "participants_filtered", @render, @
			self.on "pager_next", @render, @
			self.on "pager_prev", @render, @
			self.on "page_loaded", @render, @
			
			coll.fetch
				success:() ->
					coll.pager()
					self.trigger "data_loaded"
					return
				silent: true

			return

		addAll: ->
			@$el.empty()
			@collection.each @addOne
			return

		addOne: (viewModel) ->
			# DETERMINE IF THE ROWMODEL CONTAINS THE ATTRIBUTE ISSELECTED
			if typeof viewModel.get("ISSELECTED") == "undefined"
				viewModel.set ISSELECTED: false
				viewModel.set ISFILTERMATCH: false
			
			if typeof self.rows == "undefined"
				self.rows = []

			row = new self.Row 
				model: viewModel

			self.rows.push row 

			$(".js-attendee-rows").append row.render().el
			
			return

		render: ->
			self.trigger "collection_rendered"
	return
,ce._core.models
	