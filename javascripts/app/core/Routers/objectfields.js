#! ce._core.routers.Objectfields extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectfields = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectfields/:id/show": "show"
    "objectfields/:id/edit": "edit"
  )

