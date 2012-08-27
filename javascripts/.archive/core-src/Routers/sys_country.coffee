#! ce._core.routers.Sys_country.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_country.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_country.coffee/:id/show": "show"
    "sys_country.coffee/:id/edit": "edit"
  )

