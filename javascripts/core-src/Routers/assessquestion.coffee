#! ce._core.routers.Assessquestion.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessquestion.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessquestion.coffee/:id/show": "show"
    "assessquestion.coffee/:id/edit": "edit"
  )

