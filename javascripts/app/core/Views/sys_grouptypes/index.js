#! ce._core.views.sys_grouptypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_grouptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_grouptypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_grouptypes").append itemView.el

    newRecord: ->
  )

