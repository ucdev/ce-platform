#! ce._core.routers.Activity_faculties extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_faculties = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_faculties/:id/show": "show"
    "activity_faculties/:id/edit": "edit"
  )

