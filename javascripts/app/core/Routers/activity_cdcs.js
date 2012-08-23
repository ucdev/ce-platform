#! ce._core.routers.Activity_cdcs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_cdcs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_cdcs/:id/show": "show"
    "activity_cdcs/:id/edit": "edit"
  )

