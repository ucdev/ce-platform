#! ce._core.views.activity_faculties.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_faculties", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_faculties/show")

