#! ce._core.routers.Objectform.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectform.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectform.coffee/:id/show": "show"
    "objectform.coffee/:id/edit": "edit"
  )

