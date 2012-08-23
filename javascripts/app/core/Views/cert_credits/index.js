#! ce._core.views.cert_credits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.cert_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "cert_credits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".cert_credits").append itemView.el

    newRecord: ->
  )

