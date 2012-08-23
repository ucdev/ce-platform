#! ce._core.routers.Activity_finfee.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finfee.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finfee.coffee/:id/show": "show"
    "activity_finfee.coffee/:id/edit": "edit"
  )

