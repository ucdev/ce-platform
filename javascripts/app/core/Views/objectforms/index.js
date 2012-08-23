#! ce._core.views.objectforms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objectforms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objectforms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objectforms").append itemView.el

    newRecord: ->
  )

