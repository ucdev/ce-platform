/*! app/models/sys_cbofund 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbofund
*/
define("app/models/Sys_cbofund",function(require,app) {
	app.models.Sys_cbofund = app.Model.extend({
			url: function() {
				base = "/api/sys_cbofunds/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
