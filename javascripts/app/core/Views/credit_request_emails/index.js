#! ce._core.views.credit_request_emails.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.credit_request_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "credit_request_emails/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".credit_request_emails").append itemView.el

    newRecord: ->
  )

