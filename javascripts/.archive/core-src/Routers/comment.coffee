#! ce._core.routers.Comment.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Comment.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "comment.coffee/:id/show": "show"
    "comment.coffee/:id/edit": "edit"
  )

