#! ce._core.routers.Occupations extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Occupations = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "occupations/:id/show": "show"
    "occupations/:id/edit": "edit"
  )

