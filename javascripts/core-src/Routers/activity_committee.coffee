#! ce._core.routers.Activity_committee.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_committee.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_committee.coffee/:id/show": "show"
    "activity_committee.coffee/:id/edit": "edit"
  )

