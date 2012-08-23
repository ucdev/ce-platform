#! ce._core.views.sys_categorylms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_categorylms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_categorylms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_categorylms").append itemView.el

    newRecord: ->
  )

