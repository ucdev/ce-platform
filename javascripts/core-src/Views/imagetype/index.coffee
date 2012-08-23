#! ce._core.views.index.coffee.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.index.coffee", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "index.coffee/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".index.coffee").append itemView.el

    newRecord: ->
  )

