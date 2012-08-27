ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.on "selectallcheckbox_deselectall", ->
		ce.log.info "selectallcheckbox: deselected all models"
		return

	self.on "selectallcheckbox_deselectvisible", ->
		ce.log.info "selectallcheckbox: deselected visible models"
		return

	self.on "selectallcheckbox_rendered", ->
		ce.log.info "selectallcheckbox: loaded"
		return
		
	self.on "selectallcheckbox_selectall", ->
		ce.log.info "selectallcheckbox: selected all models"
		return
		
	self.on "selectallcheckbox_selectvisible", ->
		ce.log.info "selectallcheckbox: selected visible models"
		return
	return