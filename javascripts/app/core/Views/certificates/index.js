#! ce._core.views.certificates.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.certificates", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "certificates/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".certificates").append itemView.el

    newRecord: ->
  )

