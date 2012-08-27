/*! app/models/sys_testtype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_testtype
*/
define("app/models/Sys_testtype",function(require,app) {
	app.models.Sys_testtype = app.Model.extend({
			url: function() {
				base = "/api/sys_testtypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
