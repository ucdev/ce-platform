#! ce._core.views.objectdatas.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectdatas", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objectdatas/show")

