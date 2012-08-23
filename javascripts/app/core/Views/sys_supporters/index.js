#! ce._core.views.sys_supporters.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_supporters", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_supporters/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_supporters").append itemView.el

    newRecord: ->
  )

