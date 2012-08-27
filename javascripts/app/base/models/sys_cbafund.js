/*! app/models/sys_cbafund 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbafund
*/
define("app/models/sys_cbafund",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_cbafundModel = AppModel.extend({
		url: function() {
			base = "/api/sys_cbafunds/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_cbafundModel)
});
