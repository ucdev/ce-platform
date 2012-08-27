/*! app/models/sys_occclass 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_occclass
*/
define("app/models/sys_occclass",["require","app"],function(require,app) {
	var Sys_occclassModel = app.Model.extend({
		url: function() {
			base = "/api/sys_occclasses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_occclassModel)
});
