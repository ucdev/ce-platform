/*! app/models/sys_assesstype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assesstype
*/
define("app/models/Sys_assesstype",function(require,app) {
	app.models.Sys_assesstype = app.Model.extend({
			url: function() {
				base = "/api/sys_assesstypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
