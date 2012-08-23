#! ce._core.views.sys_stat_log_types.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_stat_log_types", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_stat_log_types/show")

