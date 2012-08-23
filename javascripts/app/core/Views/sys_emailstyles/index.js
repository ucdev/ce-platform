#! ce._core.views.sys_emailstyles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_emailstyles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_emailstyles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_emailstyles").append itemView.el

    newRecord: ->
  )

