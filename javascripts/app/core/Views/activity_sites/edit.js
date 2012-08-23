#! ce._core.views.activity_sites.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_sites", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_sites/edit")

