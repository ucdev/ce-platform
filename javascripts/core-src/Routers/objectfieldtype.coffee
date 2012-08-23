#! ce._core.routers.Objectfieldtype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectfieldtype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectfieldtype.coffee/:id/show": "show"
    "objectfieldtype.coffee/:id/edit": "edit"
  )

