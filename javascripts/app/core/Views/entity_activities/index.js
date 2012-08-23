#! ce._core.views.entity_activities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_activities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_activities").append itemView.el

    newRecord: ->
  )

