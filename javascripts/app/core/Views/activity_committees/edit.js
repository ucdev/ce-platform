#! ce._core.views.activity_committees.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_committees", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_committees/edit")

