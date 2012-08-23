#! ce._core.routers.Sys_credit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_credit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_credit.coffee/:id/show": "show"
    "sys_credit.coffee/:id/edit": "edit"
  )

