#! ce._core.routers.Sys_attendeestatus.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_attendeestatus.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_attendeestatus.coffee/:id/show": "show"
    "sys_attendeestatus.coffee/:id/edit": "edit"
  )

