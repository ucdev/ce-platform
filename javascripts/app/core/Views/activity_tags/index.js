#! ce._core.views.activity_tags.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_tags", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_tags/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_tags").append itemView.el

    newRecord: ->
  )

