/*! app/models/sys_report 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_report
*/
define("app/models/Sys_report",function(require,app) {
	app.models.Sys_report = app.Model.extend({
			url: function() {
				base = "/api/sys_reports/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
