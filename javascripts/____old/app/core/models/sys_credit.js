/*! app/models/sys_credit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_credit
*/
define("app/models/Sys_credit",function(require,app) {
	app.models.Sys_credit = app.Model.extend({
			url: function() {
				base = "/api/sys_credits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
