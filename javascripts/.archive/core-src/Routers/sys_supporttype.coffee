#! ce._core.routers.Sys_supporttype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_supporttype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_supporttype.coffee/:id/show": "show"
    "sys_supporttype.coffee/:id/edit": "edit"
  )

