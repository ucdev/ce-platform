#! ce._core.routers.Attendee.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee.coffee/:id/show": "show"
    "attendee.coffee/:id/edit": "edit"
  )

