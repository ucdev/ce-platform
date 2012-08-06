ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.List = Backbone.View.extend({
    template: ce.templates.get("activity_participants-table"),
    className: "activity_participants-page",
    initialize: function() {
      var coll;
      coll = this.collection;
      coll.on("add", this.addOne, this);
      coll.on("all", this.render, this);
      return coll.on("reset", this.addAll, this);
    },
    render: function() {
      return this.$el.append(_.template(this.template));
    }
  });
});