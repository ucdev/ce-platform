// Generated by CoffeeScript 1.3.3

ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  return self.Adder = Backbone.View.extend({
    template: "activity_participants-addbtn",
    initialize: function() {},
    events: {
      "click .js-add-btn": "add"
    },
    render: function() {
      var _temp;
      this.$el.empty();
      _temp = _.template(ce.templates.get(this.template));
      this.$el.append(_temp);
      self.trigger("adder_loaded");
      return this.el;
    },
    add: function() {
      return this.collection.add(this.options.defaults);
    }
  });
});