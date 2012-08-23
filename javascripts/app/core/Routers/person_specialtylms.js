#! ce._core.routers.Person_specialtylms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_specialtylms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_specialtylms/:id/show": "show"
    "person_specialtylms/:id/edit": "edit"
  )

