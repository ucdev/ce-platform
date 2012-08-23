#! ce._core.views.sys_historystyles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_historystyles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_historystyles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_historystyles").append itemView.el

    newRecord: ->
  )

