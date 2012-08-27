#! ce._core.routers.Authority.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Authority.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "authority.coffee/:id/show": "show"
    "authority.coffee/:id/edit": "edit"
  )

