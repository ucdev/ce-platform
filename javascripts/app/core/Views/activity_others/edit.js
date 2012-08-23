#! ce._core.views.activity_others.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_others", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_others/edit")

