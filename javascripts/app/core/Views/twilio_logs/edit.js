#! ce._core.views.twilio_logs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.twilio_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "twilio_logs/edit")

