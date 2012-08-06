ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Row = Backbone.Marionette.ItemView.extend({
    tagName: "tr",
    className: "personRow AllAttendees js-all-attendee",
    template: "activity_participants-row"
  });
});