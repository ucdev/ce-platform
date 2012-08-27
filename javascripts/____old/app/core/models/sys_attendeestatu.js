/*! app/models/sys_attendeestatu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_attendeestatu
*/
define("app/models/Sys_attendeestatu",function(require,app) {
	app.models.Sys_attendeestatu = app.Model.extend({
			url: function() {
				base = "/api/sys_attendeestatuses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
