#! ce._core.routers.Process.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Process.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "process.coffee/:id/show": "show"
    "process.coffee/:id/edit": "edit"
  )

