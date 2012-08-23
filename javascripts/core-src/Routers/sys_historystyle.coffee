#! ce._core.routers.Sys_historystyle.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_historystyle.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_historystyle.coffee/:id/show": "show"
    "sys_historystyle.coffee/:id/edit": "edit"
  )

