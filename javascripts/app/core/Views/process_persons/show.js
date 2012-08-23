#! ce._core.views.process_persons.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.process_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "process_persons/show")

