#! ce._core.routers.Activity_specialtylms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_specialtylms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_specialtylms/:id/show": "show"
    "activity_specialtylms/:id/edit": "edit"
  )

