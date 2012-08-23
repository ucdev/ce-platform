#! ce._core.views.entityroles.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entityroles/show")

