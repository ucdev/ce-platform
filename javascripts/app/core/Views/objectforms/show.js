#! ce._core.views.objectforms.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectforms", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objectforms/show")

