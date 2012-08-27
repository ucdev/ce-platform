/*! app/models/sys_projecttype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_projecttype
*/
define("app/models/Sys_projecttype",function(require,app) {
	app.models.Sys_projecttype = app.Model.extend({
			url: function() {
				base = "/api/sys_projecttypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
