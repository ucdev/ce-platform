#! ce._core.routers.Sys_apiclient.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_apiclient.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_apiclient.coffee/:id/show": "show"
    "sys_apiclient.coffee/:id/edit": "edit"
  )

