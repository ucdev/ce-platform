/*! app/models/sys_country 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_country
*/
define("app/models/Sys_country",function(require,app) {
	app.models.Sys_country = app.Model.extend({
			url: function() {
				base = "/api/sys_countries/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
