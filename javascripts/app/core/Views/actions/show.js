#! ce._core.views.actions.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.actions", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "actions/show")

