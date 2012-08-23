#! ce._core.views.activity_finbudgets.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_finbudgets", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_finbudgets/show")

