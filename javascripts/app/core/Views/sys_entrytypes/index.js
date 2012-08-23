#! ce._core.views.sys_entrytypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_entrytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_entrytypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_entrytypes").append itemView.el

    newRecord: ->
  )

