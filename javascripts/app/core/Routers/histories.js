#! ce._core.routers.Histories extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Histories = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "histories/:id/show": "show"
    "histories/:id/edit": "edit"
  )

