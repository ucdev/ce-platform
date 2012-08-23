#! ce._core.views.credit_request_imports.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.credit_request_imports", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "credit_request_imports/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".credit_request_imports").append itemView.el

    newRecord: ->
  )

