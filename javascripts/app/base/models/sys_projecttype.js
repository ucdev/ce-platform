/*! app/models/sys_projecttype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_projecttype
*/
define("app/models/sys_projecttype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_projecttypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_projecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_projecttypeModel)
});
