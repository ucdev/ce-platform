#! ce._core.routers.Main extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Main = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "main/:id/show": "show"
    "main/:id/edit": "edit"
  )

