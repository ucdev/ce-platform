#! ce._core.routers.Attendee_steps extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_steps = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_steps/:id/show": "show"
    "attendee_steps/:id/edit": "edit"
  )

