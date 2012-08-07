#! ce._core.views.activity_cdc.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_cdc", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_cdc/edit")

