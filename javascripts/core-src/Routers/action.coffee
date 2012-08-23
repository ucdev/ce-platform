#! ce._core.routers.Action.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Action.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "action.coffee/:id/show": "show"
    "action.coffee/:id/edit": "edit"
  )

