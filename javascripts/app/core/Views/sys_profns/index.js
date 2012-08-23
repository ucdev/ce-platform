#! ce._core.views.sys_profns.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_profns", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_profns/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_profns").append itemView.el

    newRecord: ->
  )

