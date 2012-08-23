#! ce._core.views.sys_subscriptiontypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_subscriptiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_subscriptiontypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_subscriptiontypes").append itemView.el

    newRecord: ->
  )

