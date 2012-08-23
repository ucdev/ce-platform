#! ce._core.routers.Attendee_addresses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_addresses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_addresses/:id/show": "show"
    "attendee_addresses/:id/edit": "edit"
  )

