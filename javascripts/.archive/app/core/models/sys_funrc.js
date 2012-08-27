/*! app/models/sys_funrc 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrc
*/
define("app/models/Sys_funrc",function(require,app) {
	app.models.Sys_funrc = app.Model.extend({
			url: function() {
				base = "/api/sys_funrcs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
