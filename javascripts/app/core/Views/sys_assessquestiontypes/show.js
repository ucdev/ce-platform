#! ce._core.views.sys_assessquestiontypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_assessquestiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_assessquestiontypes/show")

