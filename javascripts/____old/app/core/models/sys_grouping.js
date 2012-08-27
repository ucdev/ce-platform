/*! app/models/sys_grouping 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouping
*/
define("app/models/Sys_grouping",function(require,app) {
	app.models.Sys_grouping = app.Model.extend({
			url: function() {
				base = "/api/sys_groupings/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
