#! ce._core.views.activity_notes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_notes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_notes").append itemView.el

    newRecord: ->
  )

