#! ce._core.views.assessresults.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assessresults", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assessresults/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assessresults").append itemView.el

    newRecord: ->
  )

