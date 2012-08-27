#! ce._core.routers.Model.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Model.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "model.coffee/:id/show": "show"
    "model.coffee/:id/edit": "edit"
  )

