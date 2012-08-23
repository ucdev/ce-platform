#! ce._core.views.attendee_phones.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_phones", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendee_phones/show")

