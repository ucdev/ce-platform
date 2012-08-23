#! ce._core.views.activity_steps.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_steps/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_steps").append itemView.el

    newRecord: ->
  )

