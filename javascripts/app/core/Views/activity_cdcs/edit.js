#! ce._core.views.activity_cdcs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_cdcs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_cdcs/edit")

