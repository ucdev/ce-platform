#! ce._core.views.sys_reports.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_reports", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_reports/edit")

