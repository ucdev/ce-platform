ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.on "bottombar_loaded", ->
		ce.log.info "participants: bottom bar loaded"
		return

	self.on "collection_rendered", ->
		ce.log.info "participants: collection rendered"
		return

	self.on "page_loaded", ->
		ce.log.info "participants: page ready"
		return

	self.on "page_reloaded", ->
		ce.log.info "participants: page reloaded"
		return

	self.on "participant_md_toggled", ->
		ce.log.info "participant: updated MD status"
		return

	self.on "participant_removed", ->
		ce.log.info "participant: removed"
		return

	self.on "participant_reset", ->
		ce.log.info "participant: reset"
		return

	self.on "participant_saved", ->
		ce.log.info "participant: saved"
		return

	self.on "participant_status_updated", (name) ->
		ce.log.info "participants: statuses updated to " + name
		return

	self.on "participants_loaded", ->
		ce.log.info "participants: loaded"
		return

	self.on "participants_removed", (participants) ->
		ce.log.info "participants: " + participants.length + " removed"
		return

	self.on 'printer_loaded', ->
		ce.log.info "printer: loaded"
		return

	self.on 'printer_printed', ->
		ce.log.info "printer: job done"
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