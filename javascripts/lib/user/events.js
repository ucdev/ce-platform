// Generated by CoffeeScript 1.3.3

ce.module("user", function(self, ce, Backbone, Marionette, $, _) {
  self.on("loggedIn", function() {
    ce.log.info("user: logged in");
  });
  self.on("loggedOut", function() {
    ce.log.warn("user: logged out");
  });
  self.on("loaded", function() {
    ce.log.info("user: loaded");
  });
});
