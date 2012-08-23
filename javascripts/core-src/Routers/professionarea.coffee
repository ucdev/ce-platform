#! ce._core.routers.Professionarea.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Professionarea.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "professionarea.coffee/:id/show": "show"
    "professionarea.coffee/:id/edit": "edit"
  )

