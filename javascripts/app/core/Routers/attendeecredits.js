#! ce._core.routers.Attendeecredits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendeecredits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendeecredits/:id/show": "show"
    "attendeecredits/:id/edit": "edit"
  )

