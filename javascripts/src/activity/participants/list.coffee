#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
	self.List = Backbone.View.extend
		initialize: ->
			coll = @collection
			coll.on "add", @addOne, @
			coll.on "all", @render, @
			coll.on "reset", @addAll, @
			
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
			viewModel.attributes.ISSELECTED = false
			
			view = new self.Row  model: viewModel
			$(".js-attendee-rows").append view.render().el
			
			return

,ce._core.models
	