#! ce._core.routers.Sys_attendeestatuses extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_attendeestatuses = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_attendeestatuses/:id/show": "show"
    "sys_attendeestatuses/:id/edit": "edit"
  )

