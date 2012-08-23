#! ce._core.views.sys_assessresultstatuses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_assessresultstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_assessresultstatuses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_assessresultstatuses").append itemView.el

    newRecord: ->
  )

