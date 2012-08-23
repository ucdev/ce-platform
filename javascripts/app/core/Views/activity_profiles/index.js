#! ce._core.views.activity_profiles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_profiles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_profiles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_profiles").append itemView.el

    newRecord: ->
  )

