#! ce._core.views.person_specialtylms.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_specialtylms", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_specialtylms/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_specialtylms").append itemView.el

    newRecord: ->
  )

