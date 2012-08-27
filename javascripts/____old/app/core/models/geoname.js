/*! app/models/geoname 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Geoname
*/
define("app/models/Geoname",function(require,app) {
	app.models.Geoname = app.Model.extend({
			url: function() {
				base = "/api/geonames/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
