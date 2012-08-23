#! ce._core.views.sys_attendeestatuses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_attendeestatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_attendeestatuses/edit")

