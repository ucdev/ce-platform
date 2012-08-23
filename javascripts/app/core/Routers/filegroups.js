#! ce._core.routers.Filegroups extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Filegroups = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "filegroups/:id/show": "show"
    "filegroups/:id/edit": "edit"
  )

