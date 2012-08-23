#! ce._core.views.sys_reports.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_reports", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_reports/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_reports").append itemView.el

    newRecord: ->
  )

