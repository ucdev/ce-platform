#! ce._core.views.sys_activitytypes.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_activitytypes/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

