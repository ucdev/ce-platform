/*! app/models/sys_subscriptiontype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_subscriptiontype
*/
define("app/models/sys_subscriptiontype",["require","app"],function(require,app) {
	var Sys_subscriptiontypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_subscriptiontypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_subscriptiontypeModel)
});
