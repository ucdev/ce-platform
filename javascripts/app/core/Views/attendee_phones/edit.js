#! ce._core.views.attendee_phones.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_phones", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "attendee_phones/edit")

