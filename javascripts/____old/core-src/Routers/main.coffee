#! ce._core.routers.Main.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Main.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "main.coffee/:id/show": "show"
    "main.coffee/:id/edit": "edit"
  )

