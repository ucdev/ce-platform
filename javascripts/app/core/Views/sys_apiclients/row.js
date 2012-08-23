#! ce._core.views.sys_apiclients.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_apiclients", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_apiclients/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

