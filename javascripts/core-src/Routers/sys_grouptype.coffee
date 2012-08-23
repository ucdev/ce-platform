#! ce._core.routers.Sys_grouptype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_grouptype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_grouptype.coffee/:id/show": "show"
    "sys_grouptype.coffee/:id/edit": "edit"
  )

