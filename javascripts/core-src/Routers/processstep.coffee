#! ce._core.routers.Processstep.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processstep.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processstep.coffee/:id/show": "show"
    "processstep.coffee/:id/edit": "edit"
  )

