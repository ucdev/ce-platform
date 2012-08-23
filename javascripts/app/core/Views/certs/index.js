#! ce._core.views.certs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.certs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "certs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".certs").append itemView.el

    newRecord: ->
  )

