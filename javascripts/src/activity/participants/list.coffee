#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
  self.List = Backbone.View.extend
    initialize: ->
      coll = @collection
      coll.on "add", @addOne, this
      coll.on "all", @render, this
      coll.on "reset", @addAll, this

      coll.fetch
        success:() ->
          coll.pager()
          self.trigger "data_loaded"
          return
        silent: true

      return

    render: ->
      # RENDER TEMPLATE AND USE AS PAGE HTML
      #@$el.append _.template @template

    addAll: ->
      @$el.empty()
      @collection.each @addOne
      return

    addOne: (viewModel) ->
      view = new self.Row  model: viewModel
      $(".js-attendee-rows").append view.render().el
      
      return

,ce._core.models
  