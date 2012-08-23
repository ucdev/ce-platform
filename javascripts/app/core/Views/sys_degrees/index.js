#! ce._core.views.sys_degrees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_degrees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_degrees").append itemView.el

    newRecord: ->
  )

