/*! app/models/sys_supporttype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporttype
*/
define("app/models/Sys_supporttype",function(require,app) {
	app.models.Sys_supporttype = app.Model.extend({
			url: function() {
				base = "/api/sys_supporttypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
