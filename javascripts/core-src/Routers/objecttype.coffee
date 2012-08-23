#! ce._core.routers.Objecttype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objecttype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objecttype.coffee/:id/show": "show"
    "objecttype.coffee/:id/edit": "edit"
  )

