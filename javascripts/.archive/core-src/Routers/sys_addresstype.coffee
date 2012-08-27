#! ce._core.routers.Sys_addresstype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_addresstype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_addresstype.coffee/:id/show": "show"
    "sys_addresstype.coffee/:id/edit": "edit"
  )

