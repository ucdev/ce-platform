#! ce._core.views.stat_logs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.stat_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "stat_logs/show")

