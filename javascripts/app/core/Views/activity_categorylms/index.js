#! ce._core.views.activity_categorylms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_categorylms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_categorylms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_categorylms").append itemView.el

    newRecord: ->
  )

