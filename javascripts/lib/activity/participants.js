ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.load = function(params) {
    self.details = {
      activityId: ce.activity.Model.get("id"),
      AddlAttendees: params.legacy.AddlAttendees,
      currAttendee: params.legacy.currAttendee,
      currPerson: params.legacy.currPerson,
      MaxRegistrants: params.legacy.MaxRegistrants,
      NoChange: params.legacy.NoChange,
      nPageNo: params.legacy.nPageNo,
      nStatus: params.legacy.nStatus,
      selectedRows: params.legacy.selectedRows,
      selectedCount: params.legacy.selectedCount,
      totalAttendeeList: params.legacy.totalAttendeeList,
      rowsPerPage: params.legacy.rowsPerPage,
      totalPages: params.legacy.totalPages
    };
    self.paginatorCollection = ce.Collections.Activity_participants.extend({
      server_api: {
        $format: "json",
        activityId: ce.activity.Model.get("id"),
        orderby: "fullName",
        $skip: function() {
          return this.totalPages * this.perPage;
        }
      }
    });
    self.collection = new self.paginatorCollection().add(params.records);
    self.collection.pager();
    self.topbar = new self.Topbar({
      el: ".js-top-bar"
    }).render();
    self.pager = new ce.ui.Pager({
      el: $(".js-pager-container"),
      collection: self.collection
    }).render();
    return self.trigger("page_loaded");
  };
});