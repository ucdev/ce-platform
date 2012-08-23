#! ce._core.routers.Activity_comment.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_comment.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_comment.coffee/:id/show": "show"
    "activity_comment.coffee/:id/edit": "edit"
  )

