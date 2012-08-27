/*! app/models/sys_addresstype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_addresstype
*/
define("app/models/sys_addresstype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_addresstypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_addresstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_addresstypeModel)
});
