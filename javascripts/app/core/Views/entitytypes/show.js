#! ce._core.views.entitytypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entitytypes/show")

