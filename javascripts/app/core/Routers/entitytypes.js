#! ce._core.routers.Entitytypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entitytypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entitytypes/:id/show": "show"
    "entitytypes/:id/edit": "edit"
  )

