#! ce._core.routers.Process_person.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Process_person.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "process_person.coffee/:id/show": "show"
    "process_person.coffee/:id/edit": "edit"
  )

