#! ce._core.views.groups.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.groups", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "groups/show")

