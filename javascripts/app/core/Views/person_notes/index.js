#! ce._core.views.person_notes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_notes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_notes").append itemView.el

    newRecord: ->
  )

