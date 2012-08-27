/*! app/models/sys_apiclient 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_apiclient
*/
define("app/models/sys_apiclient",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_apiclientModel = AppModel.extend({
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
