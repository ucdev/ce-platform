#! ce._core.views.twilio_logs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.twilio_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "twilio_logs/show")

