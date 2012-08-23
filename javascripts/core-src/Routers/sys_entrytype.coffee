#! ce._core.routers.Sys_entrytype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_entrytype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_entrytype.coffee/:id/show": "show"
    "sys_entrytype.coffee/:id/edit": "edit"
  )

