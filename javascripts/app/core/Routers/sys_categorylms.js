#! ce._core.routers.Sys_categorylms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_categorylms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_categorylms/:id/show": "show"
    "sys_categorylms/:id/edit": "edit"
  )

