#! ce._core.views.attendeecredits.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendeecredits", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendeecredits/show")

