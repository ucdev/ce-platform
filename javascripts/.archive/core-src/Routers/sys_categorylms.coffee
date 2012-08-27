#! ce._core.routers.Sys_categorylms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_categorylms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_categorylms.coffee/:id/show": "show"
    "sys_categorylms.coffee/:id/edit": "edit"
  )

