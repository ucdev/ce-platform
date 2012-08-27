/*! app/models/sys_grouptype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouptype
*/
define("app/models/sys_grouptype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_grouptypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_grouptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_grouptypeModel)
});
