/*! app/models/sys_apiclient 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_apiclient
*/
define("app/models/Sys_apiclient",function(require,app) {
	app.models.Sys_apiclient = app.Model.extend({
			url: function() {
				base = "/api/sys_apiclients/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
