#! ce._core.views.person_prefs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_prefs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_prefs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_prefs").append itemView.el

    newRecord: ->
  )

