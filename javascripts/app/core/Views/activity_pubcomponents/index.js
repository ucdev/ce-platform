#! ce._core.views.activity_pubcomponents.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_pubcomponents", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_pubcomponents/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_pubcomponents").append itemView.el

    newRecord: ->
  )

