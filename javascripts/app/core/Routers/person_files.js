#! ce._core.routers.Person_files extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_files = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_files/:id/show": "show"
    "person_files/:id/edit": "edit"
  )

