#! ce._core.routers.Attendee_step.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_step.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_step.coffee/:id/show": "show"
    "attendee_step.coffee/:id/edit": "edit"
  )

