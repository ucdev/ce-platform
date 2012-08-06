#! ce.Routers.Assets extends Backbone.Marionette.AppRouter 
ce.module "Routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assets = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assets/:id/show": "show"
    "assets/:id/edit": "edit"
  )

