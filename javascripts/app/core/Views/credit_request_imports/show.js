#! ce._core.views.credit_request_imports.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_imports", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "credit_request_imports/show")

