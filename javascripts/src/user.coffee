#! ce.user @description: represents the current user 
ce.module "user", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Model = models.Person.extend({})
	
	self.load = (params) ->
		self.model = new self.Model(params)
		self.trigger "loaded"
		return

	$ ->
		$(".loginLink").click (ev) ->
			self.login {}

			ev.preventDefault()
			false
		return
	return
, ce._core.models