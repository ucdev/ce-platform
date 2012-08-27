/*! app/models/sys_report 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_report
*/
define("app/models/sys_report",["require","app"],function(require,app) {
	var Sys_reportModel = app.Model.extend({
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
