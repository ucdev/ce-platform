#! ce._core.views.sessions.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sessions", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sessions/show")

