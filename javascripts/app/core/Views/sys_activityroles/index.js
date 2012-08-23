#! ce._core.views.sys_activityroles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_activityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_activityroles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_activityroles").append itemView.el

    newRecord: ->
  )

