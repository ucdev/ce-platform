/*! app/models/sys_supporter 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporter
*/
define("app/models/sys_supporter",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_supporterModel = AppModel.extend({
		url: function() {
			base = "/api/sys_supporters/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporterModel)
});
