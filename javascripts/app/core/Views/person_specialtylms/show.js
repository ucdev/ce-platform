#! ce._core.views.person_specialtylms.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_specialtylms", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_specialtylms/show")

