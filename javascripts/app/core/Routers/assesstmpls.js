#! ce._core.routers.Assesstmpls extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assesstmpls = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assesstmpls/:id/show": "show"
    "assesstmpls/:id/edit": "edit"
  )

