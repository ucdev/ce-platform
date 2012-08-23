#! ce._core.views.activity_finbudgets.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_finbudgets", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_finbudgets/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_finbudgets").append itemView.el

    newRecord: ->
  )

