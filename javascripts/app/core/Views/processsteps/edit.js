#! ce._core.views.processsteps.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processsteps", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "processsteps/edit")

