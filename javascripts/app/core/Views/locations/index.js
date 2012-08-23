#! ce._core.views.locations.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.locations", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "locations/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".locations").append itemView.el

    newRecord: ->
  )

