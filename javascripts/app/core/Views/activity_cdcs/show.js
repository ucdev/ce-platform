#! ce._core.views.activity_cdcs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_cdcs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_cdcs/show")

