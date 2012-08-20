ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.on "bottombar_loaded", ->
		ce.log.info "participants: bottom bar loaded"
		return

	self.on "collection_rendered", ->
		ce.log.info "participants: collection rendered"

	self.on "filter_loaded", ->
		ce.log.info "participants: filter loaded"
		return

	self.on "page_loaded", ->
		ce.log.info "participants: page ready"
		return

	self.on "participant_saved", (data) ->
		ce.log.info "participant: saved"
		return

	self.on "participant_removed", (data) ->
		ce.log.info "participant: removed"
		return

	self.on "participant_reset", (data) ->
		ce.log.info "participant: reset"
		return

	self.on "participant_md_toggled", ->
		ce.log.info "participant: updated MD status"

	self.on "participants_filtered", (name) ->
		ce.log.info "participants: filter by " + name

	self.on "participants_loaded", ->
		ce.log.info "participants: loaded"
		return

	self.on "selectallcheckbox_rendered", ->
		ce.log.info "participants: select all checkbox loaded"

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