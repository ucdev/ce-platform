#! ce._core.views.assessanswers.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assessanswers", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assessanswers/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assessanswers").append itemView.el

    newRecord: ->
  )

