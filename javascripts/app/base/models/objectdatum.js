/*! app/models/objectdatum 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectdatum
*/
define("app/models/objectdatum",["require","app"],function(require,app) {
	var ObjectdatumModel = app.Model.extend({
		url: function() {
			base = "/api/objectdatas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectdatumModel)
});
