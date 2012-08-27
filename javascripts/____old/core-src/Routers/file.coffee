#! ce._core.routers.File.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.File.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "file.coffee/:id/show": "show"
    "file.coffee/:id/edit": "edit"
  )

