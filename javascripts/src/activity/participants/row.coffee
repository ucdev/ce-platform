ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.Row = Backbone.Marionette.ItemView.extend
    tagName: "tr"
    className: "personRow AllAttendees js-all-attendee"
    template: ce.templates.get "activity_participants-row"
    render: ->
      console.log(@model)
      # RENDER TEMPLATE AND USE AS PAGE HTML
      #@$el.append _.template @template
