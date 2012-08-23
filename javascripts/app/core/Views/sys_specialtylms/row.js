#! ce._core.views.sys_specialtylms.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_specialtylms", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_specialtylms/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

