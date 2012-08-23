#! ce._core.views.person_interest_excepts.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_interest_excepts", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "person_interest_excepts/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

