/*! app/models/sys_specialtylm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_specialtylm
*/
define("app/models/Sys_specialtylm",function(require,app) {
	app.models.Sys_specialtylm = app.Model.extend({
			url: function() {
				base = "/api/sys_specialtylms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
