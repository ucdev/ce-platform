#! ce._core.views.attendeecdcs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendeecdcs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendeecdcs/show")

