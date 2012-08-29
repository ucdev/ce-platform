Component = require "foundry/component"
class User extends Component
	constructor:() ->
		@on "loggedIn", ->
		  ce.log.info "user: logged in"
		  return

		@on "loggedOut", ->
		  ce.log.warn "user: logged out"
		  return

		@on "loaded", ->
		  ce.log.info "user: init"
		  return
module.setExports(User)