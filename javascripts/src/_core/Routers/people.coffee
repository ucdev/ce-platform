#! ce.Routers.People extends Backbone.Marionette.AppRouter 
ce.module "Routers", (self, ce, Backbone, Marionette, $, _) ->
  self.People = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "people/:id/show": "show"
    "people/:id/edit": "edit"
  )

