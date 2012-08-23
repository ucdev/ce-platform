#! ce._core.routers.Degree_credits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Degree_credits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "degree_credits/:id/show": "show"
    "degree_credits/:id/edit": "edit"
  )

