/*! app/models/person_degree 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_degree
*/
define("app/models/person_degree",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_degreeModel = AppModel.extend({
		url: function() {
			base = "/api/person_degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_degreeModel)
});
