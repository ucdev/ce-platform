/*! app/models/sys_subscriptiontype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_subscriptiontype
*/
define("app/models/sys_subscriptiontype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_subscriptiontypeModel = AppModel.extend({
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
