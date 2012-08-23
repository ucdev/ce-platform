#! ce._core.routers.Processstep_activities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processstep_activities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processstep_activities/:id/show": "show"
    "processstep_activities/:id/edit": "edit"
  )

