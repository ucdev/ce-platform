#! ce._core.views.credit_requests.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.credit_requests", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "credit_requests/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".credit_requests").append itemView.el

    newRecord: ->
  )

