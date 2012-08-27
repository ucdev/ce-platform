#! ce._core.routers.Sys_ethnicity.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_ethnicity.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_ethnicity.coffee/:id/show": "show"
    "sys_ethnicity.coffee/:id/edit": "edit"
  )

