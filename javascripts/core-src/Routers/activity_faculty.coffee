#! ce._core.routers.Activity_faculty.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_faculty.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_faculty.coffee/:id/show": "show"
    "activity_faculty.coffee/:id/edit": "edit"
  )

