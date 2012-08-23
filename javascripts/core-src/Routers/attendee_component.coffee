#! ce._core.routers.Attendee_component.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendee_component.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendee_component.coffee/:id/show": "show"
    "attendee_component.coffee/:id/edit": "edit"
  )

