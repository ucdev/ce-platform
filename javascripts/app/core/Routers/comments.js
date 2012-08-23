#! ce._core.routers.Comments extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Comments = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "comments/:id/show": "show"
    "comments/:id/edit": "edit"
  )

