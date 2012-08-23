#! ce._core.routers.Activity_finledger.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finledger.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finledger.coffee/:id/show": "show"
    "activity_finledger.coffee/:id/edit": "edit"
  )

