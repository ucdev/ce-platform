#! ce._core.routers.Groups extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Groups = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "groups/:id/show": "show"
    "groups/:id/edit": "edit"
  )

