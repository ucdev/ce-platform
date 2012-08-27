/*! app/models/sys_attendeestatu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_attendeestatu
*/
define("app/models/sys_attendeestatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_attendeestatuModel = AppModel.extend({
		url: function() {
			base = "/api/sys_attendeestatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_attendeestatuModel)
});
