#! ce.user @description: represents the current user 
ce.module "user", (self, ce, Backbone, Marionette, $, _, models) ->
  self.Model = models.Person.extend({})
  self.load = (params) ->
    self.model = new self.Model(params)
    self.trigger "loaded"

  $ ->
    $(".loginLink").click (ev) ->
      self.login {}
      false
, ce._core.models