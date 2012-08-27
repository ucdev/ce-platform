/*! app/models/sys_assessresultstatu 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessresultstatu
*/
define("app/models/Sys_assessresultstatu",function(require,app) {
	app.models.Sys_assessresultstatu = app.Model.extend({
			url: function() {
				base = "/api/sys_assessresultstatuses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
