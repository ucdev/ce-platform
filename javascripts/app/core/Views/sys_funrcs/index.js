#! ce._core.views.sys_funrcs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_funrcs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_funrcs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_funrcs").append itemView.el

    newRecord: ->
  )

