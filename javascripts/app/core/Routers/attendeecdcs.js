#! ce._core.routers.Attendeecdcs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendeecdcs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendeecdcs/:id/show": "show"
    "attendeecdcs/:id/edit": "edit"
  )

