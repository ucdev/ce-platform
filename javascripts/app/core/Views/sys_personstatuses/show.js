#! ce._core.views.sys_personstatuses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_personstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_personstatuses/show")

