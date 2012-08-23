#! ce._core.routers.Entity_relates extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entity_relates = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entity_relates/:id/show": "show"
    "entity_relates/:id/edit": "edit"
  )

