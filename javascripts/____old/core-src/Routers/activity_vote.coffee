#! ce._core.routers.Activity_vote.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_vote.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_vote.coffee/:id/show": "show"
    "activity_vote.coffee/:id/edit": "edit"
  )

