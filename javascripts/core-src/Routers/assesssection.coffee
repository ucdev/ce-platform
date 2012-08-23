#! ce._core.routers.Assesssection.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assesssection.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assesssection.coffee/:id/show": "show"
    "assesssection.coffee/:id/edit": "edit"
  )

