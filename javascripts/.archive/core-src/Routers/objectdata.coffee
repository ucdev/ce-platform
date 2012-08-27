#! ce._core.routers.Objectdata.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectdata.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectdata.coffee/:id/show": "show"
    "objectdata.coffee/:id/edit": "edit"
  )

