#! ce._core.views.activity_cdc.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_cdc", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_cdc/show")

