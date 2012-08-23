#! ce._core.views.certificates.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.certificates", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "certificates/edit")

