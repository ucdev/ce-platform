#! ce._core.views.imagetypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.imagetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "imagetypes/show")

