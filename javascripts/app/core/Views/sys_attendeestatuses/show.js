#! ce._core.views.sys_attendeestatuses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_attendeestatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_attendeestatuses/show")

