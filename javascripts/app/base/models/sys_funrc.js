/*! app/models/sys_funrc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrc
*/
define("app/models/sys_funrc",["require","app"],function(require,app) {
	var Sys_funrcModel = app.Model.extend({
		url: function() {
			base = "/api/sys_funrcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_funrcModel)
});
