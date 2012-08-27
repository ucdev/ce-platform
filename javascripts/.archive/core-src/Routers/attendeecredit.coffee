#! ce._core.routers.Attendeecredit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Attendeecredit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "attendeecredit.coffee/:id/show": "show"
    "attendeecredit.coffee/:id/edit": "edit"
  )

