#! ce._core.views.sys_markets.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_markets", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_markets/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_markets").append itemView.el

    newRecord: ->
  )

