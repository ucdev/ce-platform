#! ce._core.routers.Activity_specialtylms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_specialtylms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_specialtylms.coffee/:id/show": "show"
    "activity_specialtylms.coffee/:id/edit": "edit"
  )

