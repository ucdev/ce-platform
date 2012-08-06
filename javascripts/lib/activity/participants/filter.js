ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Filter = Backbone.Marionette.ItemView.extend({
    template: "activity_participants-filter",
    initialize: function() {
      return this.render();
    },
    el: ".js-attendee-filter",
    events: {
      "click .js-clear-attendee-search": "clearAttendeeSearch",
      "click .js-attendee-search-typeahead": "searchAttendeeList",
      "click .js-attendees-filter li.js-attendee-status": "changeActiveAttendeeStatus"
    },
    render: function() {
      var _data, _html, _temp;
      _data = {};
      _temp = this.getTemplate();
      _html = Marionette.Renderer.render(_temp);
      this.$el.html(_html);
      return self.trigger("filter_loaded");
    },
    changeActiveAttendeeStatus: function() {
      var countContainer, participants, statusLink;
      statusLink = $(this).find("a");
      countContainer = $(this).find("span");
      participants = this;
      participants.pageData.nStatus = this.id.replace("status", "");
      this.contentContainer.html("");
      return $.ajax({
        url: "/UserSettings/setAttendeeStatus",
        type: "post",
        data: {
          ActivityID: ce.activity.Model.get("id"),
          status: self.details.nStatus
        },
        success: function(data) {
          participants.pageData.nPageNo = 1;
          participants.updatePaginator();
          return participants.changePage();
        }
      });
    },
    clearAttendeeSearch: function() {
      participants.pageData.nStatus = 0;
      participants.changePage();
      participants.attendeeSearch["input"].val("");
      return participants.attendeeSearch["clear"].hide();
    },
    searchAttendeeList: function() {
      var input, statusList;
      input = $(this);
      statusList = participants.attendeeList.statuses["filtered"].attendees;
      if (input.val().length > 0) {
        participants.attendeeSearch.clear.show();
      } else {
        participants.attendeeSearch.clear.hide();
      }
      statusList.length = 0;
      participants.contentContainer.html("");
      if (input.val().length > 0) {
        $.each(participants.attendeeList["attendees"], function(i, item) {
          if ((item.FIRSTNAME.startsWith(input.val()) || item.LASTNAME.startsWith(input.val())) && !$.ListFind(statusList, item.ATTENDEEID)) {
            return statusList.push(item.ATTENDEEID);
          }
        });
        participants.pageData.nStatus = "filtered";
        participants.updatePaginator();
        return participants.changePage();
      }
    }
  });
});