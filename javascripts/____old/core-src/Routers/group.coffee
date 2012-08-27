#! ce._core.routers.Group.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Group.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "group.coffee/:id/show": "show"
    "group.coffee/:id/edit": "edit"
  )

