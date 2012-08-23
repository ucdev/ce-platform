#! ce._core.views.activity_finsupports.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_finsupports", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "activity_finsupports/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

