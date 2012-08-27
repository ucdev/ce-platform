/*! app/models/sys_degree 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_degree
*/
define("app/models/Sys_degree",function(require,app) {
	app.models.Sys_degree = app.Model.extend({
			url: function() {
				base = "/api/sys_degrees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
