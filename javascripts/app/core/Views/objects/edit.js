#! ce._core.views.objects.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objects", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "objects/edit")

