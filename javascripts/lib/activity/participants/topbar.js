ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Topbar = Backbone.View.extend({
    template: ce.templates.get("activity_participants-topbar"),
    render: function() {
      return this.$el.append(_.template(this.template));
    }
  });
});