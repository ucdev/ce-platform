#! ce._core.routers.Person_specialtylms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_specialtylms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_specialtylms.coffee/:id/show": "show"
    "person_specialtylms.coffee/:id/edit": "edit"
  )

