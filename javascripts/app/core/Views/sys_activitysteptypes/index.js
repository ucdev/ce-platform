#! ce._core.views.sys_activitysteptypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_activitysteptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_activitysteptypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_activitysteptypes").append itemView.el

    newRecord: ->
  )

