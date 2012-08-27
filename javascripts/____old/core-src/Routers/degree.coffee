#! ce._core.routers.Degree.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Degree.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "degree.coffee/:id/show": "show"
    "degree.coffee/:id/edit": "edit"
  )

