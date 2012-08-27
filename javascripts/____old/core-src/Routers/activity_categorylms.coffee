#! ce._core.routers.Activity_categorylms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_categorylms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_categorylms.coffee/:id/show": "show"
    "activity_categorylms.coffee/:id/edit": "edit"
  )

