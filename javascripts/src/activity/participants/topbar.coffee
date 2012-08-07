#! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.Topbar = Backbone.View.extend
    template: ce.templates.get "activity_participants-topbar"
    render: ->
      # RENDER TEMPLATE AND USE AS PAGE HTML
      @$el.append _.template(@template)