#! ce._core.routers.Activity_categorylms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_categorylms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_categorylms/:id/show": "show"
    "activity_categorylms/:id/edit": "edit"
  )

