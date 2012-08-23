#! ce._core.routers.Twilio_logs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Twilio_logs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "twilio_logs/:id/show": "show"
    "twilio_logs/:id/edit": "edit"
  )

