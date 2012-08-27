/*! app/models/sys_subscriptiontype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_subscriptiontype
*/
define("app/models/Sys_subscriptiontype",function(require,app) {
	app.models.Sys_subscriptiontype = app.Model.extend({
			url: function() {
				base = "/api/sys_subscriptiontypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
