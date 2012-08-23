#! ce._core.views.sys_reports.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_reports", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_reports/show")

