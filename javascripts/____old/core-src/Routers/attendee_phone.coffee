#! ce._core.routers.Attendee_phone.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_phone.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_phone.coffee/:id/show": "show"
    "attendee_phone.coffee/:id/edit": "edit"
  )

