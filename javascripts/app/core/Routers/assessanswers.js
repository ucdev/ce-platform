#! ce._core.routers.Assessanswers extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessanswers = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessanswers/:id/show": "show"
    "assessanswers/:id/edit": "edit"
  )

