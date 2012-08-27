/*! app/models/sys_supporter 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporter
*/
define("app/models/Sys_supporter",function(require,app) {
	app.models.Sys_supporter = app.Model.extend({
			url: function() {
				base = "/api/sys_supporters/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
