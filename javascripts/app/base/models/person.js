/*! app/models/person 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person
*/
define("app/models/person",["require"],function(require) {
	var AppModel = require("app/model");
	var PersonModel = AppModel.extend({
		url: function() {
			base = "/api/people/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PersonModel)
});
