#! ce._core.routers.Locationtype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Locationtype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "locationtype.coffee/:id/show": "show"
    "locationtype.coffee/:id/edit": "edit"
  )

