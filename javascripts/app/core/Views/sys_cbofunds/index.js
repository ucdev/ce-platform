#! ce._core.views.sys_cbofunds.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_cbofunds", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_cbofunds/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_cbofunds").append itemView.el

    newRecord: ->
  )

