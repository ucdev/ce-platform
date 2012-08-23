#! ce._core.views.categories.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.categories", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "categories/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".categories").append itemView.el

    newRecord: ->
  )

