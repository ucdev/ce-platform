/*! app/models/sys_country 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_country
*/
define("app/models/sys_country",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_countryModel = AppModel.extend({
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
