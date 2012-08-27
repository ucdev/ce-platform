#! ce._core.routers.Sys_testtype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_testtype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_testtype.coffee/:id/show": "show"
    "sys_testtype.coffee/:id/edit": "edit"
  )

