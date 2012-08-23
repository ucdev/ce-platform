#! ce._core.views.sys_personstatuses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_personstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_personstatuses/edit")

