#! ce._core.routers.Sys_historystyles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_historystyles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_historystyles/:id/show": "show"
    "sys_historystyles/:id/edit": "edit"
  )

