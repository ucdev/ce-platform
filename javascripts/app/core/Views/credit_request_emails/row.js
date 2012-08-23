#! ce._core.views.credit_request_emails.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "credit_request_emails/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

