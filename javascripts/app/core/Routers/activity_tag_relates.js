#! ce._core.routers.Activity_tag_relates extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_tag_relates = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_tag_relates/:id/show": "show"
    "activity_tag_relates/:id/edit": "edit"
  )

