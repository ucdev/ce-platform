#! ce._core.routers.Assessquestions extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessquestions = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessquestions/:id/show": "show"
    "assessquestions/:id/edit": "edit"
  )

