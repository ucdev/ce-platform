#! ce._core.routers.Files extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Files = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "files/:id/show": "show"
    "files/:id/edit": "edit"
  )

