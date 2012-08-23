#! ce._core.views.person_interest_excepts.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_interest_excepts", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_interest_excepts/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_interest_excepts").append itemView.el

    newRecord: ->
  )

