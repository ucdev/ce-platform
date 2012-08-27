/*! app/models/sys_funrn 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrn
*/
define("app/models/Sys_funrn",function(require,app) {
	app.models.Sys_funrn = app.Model.extend({
			url: function() {
				base = "/api/sys_funrns/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
