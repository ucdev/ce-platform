#! ce._core.routers.Attendeecdc.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendeecdc.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendeecdc.coffee/:id/show": "show"
    "attendeecdc.coffee/:id/edit": "edit"
  )

