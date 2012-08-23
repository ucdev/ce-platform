#! ce._core.views.activity_others.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_others", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_others/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_others").append itemView.el

    newRecord: ->
  )

