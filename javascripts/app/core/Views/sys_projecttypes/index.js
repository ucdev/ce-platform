#! ce._core.views.sys_projecttypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_projecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_projecttypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_projecttypes").append itemView.el

    newRecord: ->
  )

