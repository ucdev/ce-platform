#! ce._core.views.credit_certs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.credit_certs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "credit_certs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".credit_certs").append itemView.el

    newRecord: ->
  )

