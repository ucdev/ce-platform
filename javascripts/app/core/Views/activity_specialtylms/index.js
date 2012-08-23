#! ce._core.views.activity_specialtylms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_specialtylms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_specialtylms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_specialtylms").append itemView.el

    newRecord: ->
  )

