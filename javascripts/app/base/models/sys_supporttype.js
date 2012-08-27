/*! app/models/sys_supporttype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporttype
*/
define("app/models/sys_supporttype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_supporttypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_supporttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporttypeModel)
});
