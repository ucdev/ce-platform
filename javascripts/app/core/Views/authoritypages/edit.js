#! ce._core.views.authoritypages.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.authoritypages", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "authoritypages/edit")

