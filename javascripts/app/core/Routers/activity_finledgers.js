#! ce._core.routers.Activity_finledgers extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finledgers = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finledgers/:id/show": "show"
    "activity_finledgers/:id/edit": "edit"
  )

