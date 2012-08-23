#! ce._core.routers.Sys_historytype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_historytype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_historytype.coffee/:id/show": "show"
    "sys_historytype.coffee/:id/edit": "edit"
  )

