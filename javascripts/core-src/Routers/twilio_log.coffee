#! ce._core.routers.Twilio_log.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Twilio_log.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "twilio_log.coffee/:id/show": "show"
    "twilio_log.coffee/:id/edit": "edit"
  )

