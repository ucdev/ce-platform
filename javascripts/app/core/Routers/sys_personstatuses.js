#! ce._core.routers.Sys_personstatuses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_personstatuses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_personstatuses/:id/show": "show"
    "sys_personstatuses/:id/edit": "edit"
  )

