#! ce._core.views.assesstmpls.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assesstmpls", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assesstmpls/edit")

