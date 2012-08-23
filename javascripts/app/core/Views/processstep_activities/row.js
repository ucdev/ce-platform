#! ce._core.views.processstep_activities.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processstep_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "processstep_activities/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

