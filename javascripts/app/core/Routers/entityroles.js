#! ce._core.routers.Entityroles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entityroles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entityroles/:id/show": "show"
    "entityroles/:id/edit": "edit"
  )

