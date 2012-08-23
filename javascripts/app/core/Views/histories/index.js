#! ce._core.views.histories.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.histories", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "histories/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".histories").append itemView.el

    newRecord: ->
  )

