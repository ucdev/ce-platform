/*! app/models/geoname 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Geoname
*/
define("app/models/geoname",["require","app"],function(require,app) {
	var GeonameModel = app.Model.extend({
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
