#! ce._core.views.stat_logs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.stat_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "stat_logs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".stat_logs").append itemView.el

    newRecord: ->
  )

