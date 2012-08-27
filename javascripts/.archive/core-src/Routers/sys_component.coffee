#! ce._core.routers.Sys_component.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_component.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_component.coffee/:id/show": "show"
    "sys_component.coffee/:id/edit": "edit"
  )

