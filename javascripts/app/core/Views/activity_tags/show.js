#! ce._core.views.activity_tags.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_tags", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_tags/show")

