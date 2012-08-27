/*! app/models/sys_stepstatu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_stepstatu
*/
define("app/models/Sys_stepstatu",function(require,app) {
	app.models.Sys_stepstatu = app.Model.extend({
			url: function() {
				base = "/api/sys_stepstatuses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
