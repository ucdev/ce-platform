#! ce._core.routers.Sys_projecttype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_projecttype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_projecttype.coffee/:id/show": "show"
    "sys_projecttype.coffee/:id/edit": "edit"
  )

