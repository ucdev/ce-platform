/*! app/models/sys_cbafund 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbafund
*/
define("app/models/Sys_cbafund",function(require,app) {
	app.models.Sys_cbafund = app.Model.extend({
			url: function() {
				base = "/api/sys_cbafunds/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
