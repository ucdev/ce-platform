#! ce.Views.Assets.IndexView extends Backbone.Marionette.CompositeView 
ce.module "Views.Assets", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assets/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assets").append itemView.el

    newRecord: ->
  )

