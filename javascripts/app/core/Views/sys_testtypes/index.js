#! ce._core.views.sys_testtypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_testtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_testtypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_testtypes").append itemView.el

    newRecord: ->
  )

