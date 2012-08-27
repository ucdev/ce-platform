#! ce._core.routers.Entitytype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entitytype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entitytype.coffee/:id/show": "show"
    "entitytype.coffee/:id/edit": "edit"
  )

