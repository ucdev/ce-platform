#! ce._core.views.sys_filetypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_filetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_filetypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_filetypes").append itemView.el

    newRecord: ->
  )

