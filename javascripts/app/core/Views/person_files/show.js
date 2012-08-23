#! ce._core.views.person_files.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_files", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_files/show")

