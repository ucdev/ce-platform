ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Bottombar = Backbone.View.extend({
    template: ce.templates.get("activity_participants-bottombar"),
    render: function() {
      return this.$el.html(_.template(this.template));
    }
  });
});