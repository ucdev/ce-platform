#! ce._core.routers.Sys_degree.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_degree.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_degree.coffee/:id/show": "show"
    "sys_degree.coffee/:id/edit": "edit"
  )

