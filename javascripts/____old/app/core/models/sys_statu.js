/*! app/models/sys_statu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_statu
*/
define("app/models/Sys_statu",function(require,app) {
	app.models.Sys_statu = app.Model.extend({
			url: function() {
				base = "/api/sys_statuses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
