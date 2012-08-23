#! ce._core.views.imagetypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.imagetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "imagetypes/edit")

