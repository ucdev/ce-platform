/*! app/models/sys_attendeestatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_attendeestatu
*/
define("app/models/sys_attendeestatu",["require","app"],function(require,app) {
	var Sys_attendeestatuModel = app.Model.extend({
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
