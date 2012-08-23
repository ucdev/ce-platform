#! ce._core.routers.Degree_credit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Degree_credit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "degree_credit.coffee/:id/show": "show"
    "degree_credit.coffee/:id/edit": "edit"
  )

