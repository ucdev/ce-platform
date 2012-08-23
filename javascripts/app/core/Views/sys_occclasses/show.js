#! ce._core.views.sys_occclasses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_occclasses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_occclasses/show")

