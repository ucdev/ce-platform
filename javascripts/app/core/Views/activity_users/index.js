#! ce._core.views.activity_users.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_users", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_users/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_users").append itemView.el

    newRecord: ->
  )

