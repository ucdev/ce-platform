#! ce._core.views.sessions.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sessions", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sessions/edit")

