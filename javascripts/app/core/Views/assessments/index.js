#! ce._core.views.assessments.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assessments", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assessments/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assessments").append itemView.el

    newRecord: ->
  )

