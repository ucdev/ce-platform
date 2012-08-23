#! ce._core.views.sys_activitytypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_activitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_activitytypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_activitytypes").append itemView.el

    newRecord: ->
  )

