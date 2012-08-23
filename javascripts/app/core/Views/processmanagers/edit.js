#! ce._core.views.processmanagers.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processmanagers", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "processmanagers/edit")

