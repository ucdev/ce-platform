#! ce.Routers.Activity_participants extends Backbone.Marionette.AppRouter 
ce.module "Routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_participants = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_participants/:id/show": "show"
    "activity_participants/:id/edit": "edit"
  )

