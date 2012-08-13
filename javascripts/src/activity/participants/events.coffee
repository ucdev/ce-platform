ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.on "bottombar_loaded", ->
		ce.log.info "participants: bottom bar loaded"
		return

	self.on "filter_loaded", ->
		ce.log.info "participants: filter loaded"
		return

	self.on "page_loaded", ->
		ce.log.info "participants: page ready"
		return

	self.on "participant_saved", (data) ->
		ce.log.info "participant: saved"
		return

	self.on "participants_loaded", ->
		ce.log.info "participants: loaded"
		return

	self.on "statusdate_saved", ->
		ce.log.info "participant: status date saved"
		return

	self.on "topbar_loaded", ->
		ce.log.info "participants: top bar loaded"
		return

	self.on "viewable_participant_date_changed", ->
		ce.log.info "participants: viewable date changed"
		return
  return