#! ce._core.routers.Activity_site.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_site.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_site.coffee/:id/show": "show"
    "activity_site.coffee/:id/edit": "edit"
  )

