#! ce._core.routers.Pagelayout.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayout.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayout.coffee/:id/show": "show"
    "pagelayout.coffee/:id/edit": "edit"
  )

