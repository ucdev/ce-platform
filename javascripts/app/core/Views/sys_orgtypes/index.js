#! ce._core.views.sys_orgtypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_orgtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_orgtypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_orgtypes").append itemView.el

    newRecord: ->
  )

