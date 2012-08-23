#! ce._core.routers.Assesssections extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assesssections = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assesssections/:id/show": "show"
    "assesssections/:id/edit": "edit"
  )

