#! ce._core.views.assessquestions.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assessquestions", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assessquestions/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assessquestions").append itemView.el

    newRecord: ->
  )

