#! ce._core.views.credit_request_imports.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_imports", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "credit_request_imports/edit")

