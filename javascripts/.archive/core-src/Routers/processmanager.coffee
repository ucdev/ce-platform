#! ce._core.routers.Processmanager.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processmanager.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processmanager.coffee/:id/show": "show"
    "processmanager.coffee/:id/edit": "edit"
  )

