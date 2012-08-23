#! ce._core.views.entity_persons.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_persons/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_persons").append itemView.el

    newRecord: ->
  )

