/*! app/models/sys_apiclient 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_apiclient
*/
define("app/models/sys_apiclient",["require","app"],function(require,app) {
	var Sys_apiclientModel = app.Model.extend({
		url: function() {
			base = "/api/sys_apiclients/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_apiclientModel)
});
