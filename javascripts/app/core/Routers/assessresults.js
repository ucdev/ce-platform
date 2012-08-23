#! ce._core.routers.Assessresults extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessresults = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessresults/:id/show": "show"
    "assessresults/:id/edit": "edit"
  )

