#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.List = Backbone.View.extend
    template: ce.templates.get "activity_participants-table"
    className: "activity_participants-page"
    initialize: ->
      coll = @collection
      coll.on "add", @addOne, this
      coll.on "all", @render, this
      coll.on "reset", @addAll, this

    render: ->
      
      # RENDER TEMPLATE AND USE AS PAGE HTML
      @$el.append _.template @template
  