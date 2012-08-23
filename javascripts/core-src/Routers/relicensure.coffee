#! ce._core.routers.Relicensure.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Relicensure.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "relicensure.coffee/:id/show": "show"
    "relicensure.coffee/:id/edit": "edit"
  )

