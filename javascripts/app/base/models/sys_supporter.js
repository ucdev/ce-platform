/*! app/models/sys_supporter 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporter
*/
define("app/models/sys_supporter",["require","app"],function(require,app) {
	var Sys_supporterModel = app.Model.extend({
		url: function() {
			base = "/api/sys_supporters/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporterModel)
});
