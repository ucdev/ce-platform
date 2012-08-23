#! ce._core.routers.Attendee_phones extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_phones = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_phones/:id/show": "show"
    "attendee_phones/:id/edit": "edit"
  )

