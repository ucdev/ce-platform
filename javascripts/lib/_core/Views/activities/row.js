// Generated by CoffeeScript 1.3.3

ce.module("_core.views.activities", function(self, ce, Backbone, Marionette, $, _) {
  return self.RowView = Backbone.Marionette.ItemView.extend({
    tagName: "tr",
    template: "activities/row",
    events: {
      "click .destroy": "destroy",
      "click .edit": "edit"
    },
    destroy: function() {},
    edit: function() {}
  });
});
