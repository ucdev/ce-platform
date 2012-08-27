/*! app/models/sys_personstatu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_personstatu
*/
define("app/models/Sys_personstatu",function(require,app) {
	app.models.Sys_personstatu = app.Model.extend({
			url: function() {
				base = "/api/sys_personstatuses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
