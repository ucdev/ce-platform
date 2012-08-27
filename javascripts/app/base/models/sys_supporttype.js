/*! app/models/sys_supporttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporttype
*/
define("app/models/sys_supporttype",["require","app"],function(require,app) {
	var Sys_supporttypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_supporttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporttypeModel)
});
