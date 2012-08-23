#! ce._core.routers.Entity_relate.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_relate.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_relate.coffee/:id/show": "show"
    "entity_relate.coffee/:id/edit": "edit"
  )

