#! ce._core.views.credit_request_imports.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_imports", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "credit_request_imports/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

