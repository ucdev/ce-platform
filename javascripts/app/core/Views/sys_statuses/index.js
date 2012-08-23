#! ce._core.views.sys_statuses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_statuses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_statuses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_statuses").append itemView.el

    newRecord: ->
  )

