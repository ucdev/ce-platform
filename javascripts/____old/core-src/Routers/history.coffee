#! ce._core.routers.History.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.History.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "history.coffee/:id/show": "show"
    "history.coffee/:id/edit": "edit"
  )

