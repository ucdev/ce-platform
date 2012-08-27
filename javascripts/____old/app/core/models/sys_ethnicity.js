/*! app/models/sys_ethnicity 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_ethnicity
*/
define("app/models/Sys_ethnicity",function(require,app) {
	app.models.Sys_ethnicity = app.Model.extend({
			url: function() {
				base = "/api/sys_ethnicities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
