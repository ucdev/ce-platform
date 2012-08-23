#! ce._core.routers.Grouptype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Grouptype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "grouptype.coffee/:id/show": "show"
    "grouptype.coffee/:id/edit": "edit"
  )

