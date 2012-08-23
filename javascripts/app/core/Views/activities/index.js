#! ce._core.views.activities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activities").append itemView.el

    newRecord: ->
  )

