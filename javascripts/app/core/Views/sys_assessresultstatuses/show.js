#! ce._core.views.sys_assessresultstatuses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_assessresultstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_assessresultstatuses/show")

