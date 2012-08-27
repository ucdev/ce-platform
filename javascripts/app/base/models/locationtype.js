/*! app/models/locationtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Locationtype
*/
define("app/models/locationtype",["require","app"],function(require,app) {
	var LocationtypeModel = app.Model.extend({
		url: function() {
			base = "/api/locationtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(LocationtypeModel)
});
