#! ce._core.views.activity_finledgers.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_finledgers", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_finledgers/edit")

