/*! app/models/sys_country 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_country
*/
define("app/models/sys_country",["require","app"],function(require,app) {
	var Sys_countryModel = app.Model.extend({
		url: function() {
			base = "/api/sys_countries/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_countryModel)
});
