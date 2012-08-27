/*! app/models/sys_testtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_testtype
*/
define("app/models/sys_testtype",["require","app"],function(require,app) {
	var Sys_testtypeModel = app.Model.extend({
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
