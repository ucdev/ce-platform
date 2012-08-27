#! ce._core.routers.Entity_credit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_credit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_credit.coffee/:id/show": "show"
    "entity_credit.coffee/:id/edit": "edit"
  )

