/*! app/models/sys_profc 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profc
*/
define("app/models/Sys_profc",function(require,app) {
	app.models.Sys_profc = app.Model.extend({
			url: function() {
				base = "/api/sys_profcs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
