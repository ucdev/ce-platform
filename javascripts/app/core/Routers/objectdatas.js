#! ce._core.routers.Objectdatas extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectdatas = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectdatas/:id/show": "show"
    "objectdatas/:id/edit": "edit"
  )

