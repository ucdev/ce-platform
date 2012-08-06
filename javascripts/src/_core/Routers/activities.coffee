#! ce.Routers.Activities extends Backbone.Marionette.AppRouter 
ce.module "Routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activities/:id/show": "show"
    "activities/:id/edit": "edit"
  )

