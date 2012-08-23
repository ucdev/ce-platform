#! ce._core.views.activity_categorylms.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_categorylms", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_categorylms/show")

