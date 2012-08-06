#! ce.Views.People.EditView extends Backbone.Marionette.ItemView 
ce.module "Views.People", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "people/edit")

