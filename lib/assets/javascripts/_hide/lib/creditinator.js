// Generated by CoffeeScript 1.3.3

ce.module("creditinator", function(self, ce, Backbone, Marionette, $, _, models, log, ui) {
  self.Model = ce._core.models.Credit_request.extend({});
  self.load = function(params) {
    self.model = new self.Model();
    self.stepView = new self.views.steps.Start();
    self.trigger("loaded");
  };
  self.on("loaded", function() {
    log.info("creditinator: loaded");
  });
}, ce._core.models, ce.log, ce.ui);