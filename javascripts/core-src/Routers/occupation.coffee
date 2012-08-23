#! ce._core.routers.Occupation.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Occupation.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "occupation.coffee/:id/show": "show"
    "occupation.coffee/:id/edit": "edit"
  )

