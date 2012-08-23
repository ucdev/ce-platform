#! ce._core.routers.Activity_accmes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_accmes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_accmes/:id/show": "show"
    "activity_accmes/:id/edit": "edit"
  )

