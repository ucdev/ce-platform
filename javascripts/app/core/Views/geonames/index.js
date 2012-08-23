#! ce._core.views.geonames.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.geonames", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "geonames/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".geonames").append itemView.el

    newRecord: ->
  )

