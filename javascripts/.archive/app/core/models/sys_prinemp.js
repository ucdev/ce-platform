/*! app/models/sys_prinemp 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_prinemp
*/
define("app/models/Sys_prinemp",function(require,app) {
	app.models.Sys_prinemp = app.Model.extend({
			url: function() {
				base = "/api/sys_prinemps/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
