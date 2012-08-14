#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
	self.List = Backbone.View.extend
		initialize: ->
			coll = @collection
			coll.on "add", @addOne, @
			#coll.on "all", @render, @
			coll.on "reset", @addAll, @

			self.on "filter_selected", @render, @
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
			# ADDS FILTERABLE PROPERTY TO DETERMINE IF THE ROW IS SELECTED
			
			# DETERMINE IF THE ROWMODEL CONTAINS THE ATTRIBUTE ISSELECTED
			if typeof viewModel.get("ISSELECTED") == "undefined"
				viewModel.set ISSELECTED: false
			
			view = new self.Row  model: viewModel
			$(".js-attendee-rows").append view.render().el
			
			return

		render: ->
			console.log "COLLECTION RENDERING"

,ce._core.models
	