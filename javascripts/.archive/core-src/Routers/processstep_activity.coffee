#! ce._core.routers.Processstep_activity.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processstep_activity.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processstep_activity.coffee/:id/show": "show"
    "processstep_activity.coffee/:id/edit": "edit"
  )

