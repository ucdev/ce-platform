#! ce._core.views.sys_funrns.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_funrns", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_funrns/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_funrns").append itemView.el

    newRecord: ->
  )

