ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.Row = Backbone.Marionette.ItemView.extend
    tagName: "tr"
    className: "personRow AllAttendees js-all-attendee"
    template: "activity_participants-row"
    render: ->
      # RENDER TEMPLATE AND USE AS PAGE HTML
      @$el.append _.template @template
