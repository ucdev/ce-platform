#! ce._core.views.assesstmpls.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assesstmpls", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assesstmpls/show")

