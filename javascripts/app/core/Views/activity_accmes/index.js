#! ce._core.views.activity_accmes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_accmes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_accmes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_accmes").append itemView.el

    newRecord: ->
  )

