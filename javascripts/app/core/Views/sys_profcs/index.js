#! ce._core.views.sys_profcs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_profcs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_profcs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_profcs").append itemView.el

    newRecord: ->
  )

