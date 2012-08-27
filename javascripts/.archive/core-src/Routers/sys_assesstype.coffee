#! ce._core.routers.Sys_assesstype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assesstype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assesstype.coffee/:id/show": "show"
    "sys_assesstype.coffee/:id/edit": "edit"
  )

