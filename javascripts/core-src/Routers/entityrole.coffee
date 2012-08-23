#! ce._core.routers.Entityrole.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entityrole.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entityrole.coffee/:id/show": "show"
    "entityrole.coffee/:id/edit": "edit"
  )

