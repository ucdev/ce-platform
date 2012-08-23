#! ce._core.views.stat_logs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.stat_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "stat_logs/edit")

