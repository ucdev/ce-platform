#! ce.user @description: represents the current user 
ce.module "user", (self, ce, Backbone, Marionette, $, _) ->
  self.Model = ce.Models.Person.extend({})
  self.load = (params) ->
    self.model = new self.Model(params)
    self.trigger "loaded"

  $ ->
    $(".loginLink").click (ev) ->
      self.login {}
      false


