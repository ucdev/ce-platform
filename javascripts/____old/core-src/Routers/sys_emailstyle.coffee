#! ce._core.routers.Sys_emailstyle.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_emailstyle.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_emailstyle.coffee/:id/show": "show"
    "sys_emailstyle.coffee/:id/edit": "edit"
  )

