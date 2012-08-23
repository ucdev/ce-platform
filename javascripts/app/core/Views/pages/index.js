#! ce._core.views.pages.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.pages", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "pages/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".pages").append itemView.el

    newRecord: ->
  )

