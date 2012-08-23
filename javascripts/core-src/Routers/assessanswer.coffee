#! ce._core.routers.Assessanswer.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessanswer.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessanswer.coffee/:id/show": "show"
    "assessanswer.coffee/:id/edit": "edit"
  )

