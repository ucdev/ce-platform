#! ce._core.views.person_users.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_users", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_users/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_users").append itemView.el

    newRecord: ->
  )

