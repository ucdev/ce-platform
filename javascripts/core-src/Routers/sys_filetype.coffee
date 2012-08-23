#! ce._core.routers.Sys_filetype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_filetype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_filetype.coffee/:id/show": "show"
    "sys_filetype.coffee/:id/edit": "edit"
  )

