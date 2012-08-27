/*! app/models/degree 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree
*/
define("app/models/degree",["require"],function(require) {
	var AppModel = require("app/model");
	var DegreeModel = AppModel.extend({
		url: function() {
			base = "/api/degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(DegreeModel)
});
