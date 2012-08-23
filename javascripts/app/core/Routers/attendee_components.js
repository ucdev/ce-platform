#! ce._core.routers.Attendee_components extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_components = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_components/:id/show": "show"
    "attendee_components/:id/edit": "edit"
  )

