/*! app/models/sys_profn 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profn
*/
define("app/models/Sys_profn",function(require,app) {
	app.models.Sys_profn = app.Model.extend({
			url: function() {
				base = "/api/sys_profns/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
