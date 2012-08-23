#! ce._core.views.grouptypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.grouptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "grouptypes/edit")

