#! ce._core.routers.Category.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Category.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "category.coffee/:id/show": "show"
    "category.coffee/:id/edit": "edit"
  )

