#! ce._core.routers.Sys_occclasses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_occclasses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_occclasses/:id/show": "show"
    "sys_occclasses/:id/edit": "edit"
  )

