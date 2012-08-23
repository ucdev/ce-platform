#! ce._core.routers.Attendees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendees/:id/show": "show"
    "attendees/:id/edit": "edit"
  )

