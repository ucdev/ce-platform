#! ce._core.views.person_emails.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_emails/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_emails").append itemView.el

    newRecord: ->
  )

