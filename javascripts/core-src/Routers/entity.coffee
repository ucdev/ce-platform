#! ce._core.routers.Entity.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity.coffee/:id/show": "show"
    "entity.coffee/:id/edit": "edit"
  )

