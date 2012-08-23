#! ce._core.views.activity_tag_relates.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_tag_relates", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_tag_relates/show")

