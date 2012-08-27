/*! app/models/sys_component 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_component
*/
define("app/models/Sys_component",function(require,app) {
	app.models.Sys_component = app.Model.extend({
			url: function() {
				base = "/api/sys_components/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
