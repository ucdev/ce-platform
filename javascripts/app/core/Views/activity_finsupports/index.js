#! ce._core.views.activity_finsupports.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_finsupports", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_finsupports/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_finsupports").append itemView.el

    newRecord: ->
  )

