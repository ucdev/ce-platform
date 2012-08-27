/*! app/models/sys_specialtylm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_specialtylm
*/
define("app/models/sys_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_specialtylmModel = AppModel.extend({
		url: function() {
			base = "/api/sys_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_specialtylmModel)
});
