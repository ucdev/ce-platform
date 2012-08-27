/*! app/models/sys_report 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_report
*/
define("app/models/sys_report",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_reportModel = AppModel.extend({
		url: function() {
			base = "/api/sys_reports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_reportModel)
});
