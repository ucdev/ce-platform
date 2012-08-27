#! ce._core.routers.Assessresult.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessresult.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessresult.coffee/:id/show": "show"
    "assessresult.coffee/:id/edit": "edit"
  )

