#! ce._core.views.person_interest_excepts.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_interest_excepts", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_interest_excepts/show")

