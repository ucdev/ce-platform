#! ce._core.views.objecttypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objecttypes/show")

