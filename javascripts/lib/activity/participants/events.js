ce.module("activity.participants", function(self, ce, Backbone, Marionette, $, _) {
  self.on("filter_loaded", function() {
    return ce.log.info("participants: filter loaded");
  });
  self.on("participants_loaded", function() {
    return ce.log.info("participants: loaded");
  });
  return self.on("page_loaded", function() {
    return ce.log.info("participants: page ready");
  });
});