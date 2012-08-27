/*! app/models/sys_occclass 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_occclass
*/
define("app/models/Sys_occclass",function(require,app) {
	app.models.Sys_occclass = app.Model.extend({
			url: function() {
				base = "/api/sys_occclasses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
