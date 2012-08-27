/*! app/models/sys_sitelm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_sitelm
*/
define("app/models/Sys_sitelm",function(require,app) {
	app.models.Sys_sitelm = app.Model.extend({
			url: function() {
				base = "/api/sys_sitelms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
