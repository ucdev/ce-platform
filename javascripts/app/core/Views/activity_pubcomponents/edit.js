#! ce._core.views.activity_pubcomponents.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_pubcomponents", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_pubcomponents/edit")

