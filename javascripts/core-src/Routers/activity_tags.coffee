#! ce._core.routers.Activity_tags.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_tags.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_tags.coffee/:id/show": "show"
    "activity_tags.coffee/:id/edit": "edit"
  )

