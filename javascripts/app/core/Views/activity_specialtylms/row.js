#! ce._core.views.activity_specialtylms.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_specialtylms", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "activity_specialtylms/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

