#! ce._core.views.certs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.certs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "certs/edit")

