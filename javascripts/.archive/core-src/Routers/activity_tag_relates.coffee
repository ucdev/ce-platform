#! ce._core.routers.Activity_tag_relates.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_tag_relates.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_tag_relates.coffee/:id/show": "show"
    "activity_tag_relates.coffee/:id/edit": "edit"
  )

