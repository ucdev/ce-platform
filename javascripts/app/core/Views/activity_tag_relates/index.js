#! ce._core.views.activity_tag_relates.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_tag_relates", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_tag_relates/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_tag_relates").append itemView.el

    newRecord: ->
  )

