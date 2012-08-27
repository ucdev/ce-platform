#! ce._core.routers.Attendee_address.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_address.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_address.coffee/:id/show": "show"
    "attendee_address.coffee/:id/edit": "edit"
  )

