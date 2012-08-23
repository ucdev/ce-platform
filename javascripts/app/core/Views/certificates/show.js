#! ce._core.views.certificates.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.certificates", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "certificates/show")

