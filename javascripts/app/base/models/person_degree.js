/*! app/models/person_degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_degree
*/
define("app/models/person_degree",["require","app"],function(require,app) {
	var Person_degreeModel = app.Model.extend({
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
