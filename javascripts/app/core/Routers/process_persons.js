#! ce._core.routers.Process_persons extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Process_persons = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "process_persons/:id/show": "show"
    "process_persons/:id/edit": "edit"
  )

