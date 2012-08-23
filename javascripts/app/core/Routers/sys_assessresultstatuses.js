#! ce._core.routers.Sys_assessresultstatuses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assessresultstatuses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assessresultstatuses/:id/show": "show"
    "sys_assessresultstatuses/:id/edit": "edit"
  )

