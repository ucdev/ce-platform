#! ce._core.routers.Sys_grouping.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_grouping.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_grouping.coffee/:id/show": "show"
    "sys_grouping.coffee/:id/edit": "edit"
  )

