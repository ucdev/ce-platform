#! ce._core.views.sys_sitelms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_sitelms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_sitelms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_sitelms").append itemView.el

    newRecord: ->
  )

