ce.module("ui", function(self, ce, Backbone, Marionette, $, _) {
  return self.Pager = Backbone.View.extend({
    template: ce.templates.get("ui-pager"),
    initialize: function() {
      this.collection.on("change", this.render, this);
      return this.collection.on("reset", this.render, this);
    },
    events: {
      "click a.js-next-page": "nextPage",
      "click a.js-page": "selectPage",
      "click a.js-prev-page": "prevPage"
    },
    render: function() {
      this.$el.append(_.template(this.template, this.collection.info()));
      self.trigger("pager_loaded");
      return this.el;
    },
    nextPage: function() {
      this.collection.nextPage();
      return self.trigger("pager_next");
    },
    prevPage: function() {
      this.collection.previousPage();
      return self.trigger("pager_prev");
    },
    selectPage: function() {
      var pageNo;
      pageNo = parseInt($(this).text());
      this.collection.goTo(pageNo);
      return self.trigger("pager_page_selected");
    },
    updatePageDropdown: function() {
      var dropdown, pageEl, pageLink, pageNo;
      dropdown = this.$el.find(".js-pages");
      pageNo = 1;
      while (pageNo <= this.collection.totalPages) {
        pageEl = $("<li>");
        pageLink = $("<a />").addClass("js-page").text(pageNo).append(pageLink);
        pageEl.appendTo(dropdown);
        pageNo++;
      }
      return self.trigger("pager_dropdown_loaded");
    }
  });
});