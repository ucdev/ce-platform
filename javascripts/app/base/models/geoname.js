/*! app/models/geoname 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Geoname
*/
define("app/models/geoname",["require"],function(require) {
	var AppModel = require("app/model");
	var GeonameModel = AppModel.extend({
		url: function() {
			base = "/api/geonames/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GeonameModel)
});
