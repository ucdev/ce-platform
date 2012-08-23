#! ce._core.views.page_elements.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.page_elements", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "page_elements/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".page_elements").append itemView.el

    newRecord: ->
  )

