#! ce._core.views.person_files.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_files", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_files/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_files").append itemView.el

    newRecord: ->
  )

