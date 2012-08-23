#! ce._core.views.pagelayoutmenus.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.pagelayoutmenus", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "pagelayoutmenus/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".pagelayoutmenus").append itemView.el

    newRecord: ->
  )

