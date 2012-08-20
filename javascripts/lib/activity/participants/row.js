// Generated by CoffeeScript 1.3.3

ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Row = Backbone.View.extend({
    initialize: function() {
      this.model.on("change:ISSELECTED", this.determineSelectedStatus, this);
      this.model.on("change:ISMD", function() {
        var mdStatus;
        if (this.get("ISMD")) {
          mdStatus = "y";
        } else {
          mdStatus = "n";
        }
        $.ajax({
          url: "/ajax_adm_activity/updateMDStatus",
          type: "post",
          data: {
            attendeeId: this.id,
            MDNonMD: mdStatus
          },
          success: function(data) {
            return console.log(data);
          }
        });
        return;
        return this;
      });
    },
    tagName: "tr",
    className: "personRow AllAttendees js-all-attendee",
    template: "activity_participants-row",
    bindViews: function() {
      var attributesToPass, statusDateEl;
      statusDateEl = this.$el.find(".js-status-date");
      attributesToPass = {
        STATUSID: this.model.get("STATUSID"),
        ATTENDEEID: this.model.get("ATTENDEEID"),
        COMPLETEDATE: this.model.get("COMPLETEDATE"),
        CURRSTATUSDATE: this.model.get("CURRSTATUSDATE"),
        CURRSTATUSID: this.model.get("CURRSTATUSID"),
        REGISTERDATE: this.model.get("REGISTERDATE"),
        TERMDATE: this.model.get("TERMDATE")
      };
      this.statusDate = new self.StatusDate({
        el: statusDateEl,
        model: new self.StatusDateModel(attributesToPass),
        parentModel: this.model
      }).render();
    },
    events: {
      "change .js-participant-checkbox": "selectRow",
      "click .js-delete-link": "deleteRow",
      "click .js-toggle-md": "toggleMD",
      "click .js-remove-user": "removeUser",
      "click .js-reset-user": "resetUser"
    },
    determineSelectedStatus: function() {
      if (this.model.get("ISSELECTED")) {
        this.markSelected();
      } else {
        this.markUnselected();
      }
    },
    deleteRow: function() {},
    markSelected: function() {
      this.$el.find(".js-participant-checkbox").attr("checked", true);
      this.$el.addClass("alert-info");
    },
    markUnselected: function() {
      this.$el.find(".js-participant-checkbox").attr("checked", false);
      this.$el.removeClass("alert-info");
    },
    render: function() {
      var _temp;
      this.$el.empty();
      _temp = _.template(ce.templates.get(this.template));
      this.$el.append(_temp(this.model.toJSON()));
      if (this.model.get("ISSELECTED")) {
        this.markSelected();
      }
      this.bindViews();
      return this;
    },
    removeUser: function() {
      this.model.destroy();
      self.trigger("participant_removed");
    },
    resetUser: function() {
      this.render();
      self.trigger("participant_reset");
    },
    selectRow: function(e) {
      if (this.$el.find(".js-participant-checkbox").is(":checked")) {
        this.$el.addClass("alert-info");
        this.model.set({
          "ISSELECTED": true,
          silent: true
        });
      } else {
        this.$el.removeClass("alert-info");
        this.model.set({
          "ISSELECTED": false,
          silent: true
        });
      }
      self.trigger("row_selected");
    },
    toggleMD: function() {
      if (this.model.get("ISMD")) {
        this.model.set({
          "ISMD": false
        });
      } else {
        this.model.set({
          "ISMD": true
        });
      }
      this.render();
      self.trigger("participant_md_toggled");
    }
  });
});
