#! ce.Views.Activities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "Views.Activities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activities").append itemView.el

    newRecord: ->
  )

