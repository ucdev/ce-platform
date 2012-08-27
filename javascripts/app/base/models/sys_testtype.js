/*! app/models/sys_testtype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_testtype
*/
define("app/models/sys_testtype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_testtypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_testtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_testtypeModel)
});
