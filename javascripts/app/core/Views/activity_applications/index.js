#! ce._core.views.activity_applications.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_applications", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_applications/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_applications").append itemView.el

    newRecord: ->
  )

