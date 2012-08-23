#! ce._core.views.processstep_activities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.processstep_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "processstep_activities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".processstep_activities").append itemView.el

    newRecord: ->
  )

