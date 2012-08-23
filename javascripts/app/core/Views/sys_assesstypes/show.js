#! ce._core.views.sys_assesstypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_assesstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_assesstypes/show")

