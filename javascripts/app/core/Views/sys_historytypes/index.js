#! ce._core.views.sys_historytypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_historytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_historytypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_historytypes").append itemView.el

    newRecord: ->
  )

