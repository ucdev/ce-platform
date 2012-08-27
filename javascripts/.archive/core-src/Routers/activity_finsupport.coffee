#! ce._core.routers.Activity_finsupport.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finsupport.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finsupport.coffee/:id/show": "show"
    "activity_finsupport.coffee/:id/edit": "edit"
  )

