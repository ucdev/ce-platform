#! ce._core.routers.Filegroup.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Filegroup.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "filegroup.coffee/:id/show": "show"
    "filegroup.coffee/:id/edit": "edit"
  )

