#! ce._core.views.person_interest_excepts.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_interest_excepts", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_interest_excepts/edit")

