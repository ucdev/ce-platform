/*! app/models/sys_grouptype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouptype
*/
define("app/models/Sys_grouptype",function(require,app) {
	app.models.Sys_grouptype = app.Model.extend({
			url: function() {
				base = "/api/sys_grouptypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
