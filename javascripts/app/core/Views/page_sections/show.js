#! ce._core.views.page_sections.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.page_sections", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "page_sections/show")

