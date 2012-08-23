#! ce._core.views.pagelayoutmenu_pages.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.pagelayoutmenu_pages", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "pagelayoutmenu_pages/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".pagelayoutmenu_pages").append itemView.el

    newRecord: ->
  )

