/*! app/models/sys_orgtype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_orgtype
*/
define("app/models/Sys_orgtype",function(require,app) {
	app.models.Sys_orgtype = app.Model.extend({
			url: function() {
				base = "/api/sys_orgtypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
