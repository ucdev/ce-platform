user = {}
user.load = (params) ->
	self.model = new self.Model(params)
	self.trigger "loaded"
	self.isLoggedIn()
	
	return

$ ->
	$(".loginLink").click (ev) ->
		self.login {}

		ev.preventDefault()
		false
	return
return

exports.user = self;