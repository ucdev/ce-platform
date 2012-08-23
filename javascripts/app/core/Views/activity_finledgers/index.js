#! ce._core.views.activity_finledgers.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_finledgers", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_finledgers/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_finledgers").append itemView.el

    newRecord: ->
  )

