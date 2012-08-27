#! ce._core.routers.Assesstmpl.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assesstmpl.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assesstmpl.coffee/:id/show": "show"
    "assesstmpl.coffee/:id/edit": "edit"
  )

