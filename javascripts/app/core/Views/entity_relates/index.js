#! ce._core.views.entity_relates.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_relates", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_relates/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_relates").append itemView.el

    newRecord: ->
  )

