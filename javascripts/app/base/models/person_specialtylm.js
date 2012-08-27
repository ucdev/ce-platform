/*! app/models/person_specialtylm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_specialtylm
*/
define("app/models/person_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_specialtylmModel = AppModel.extend({
		url: function() {
			base = "/api/person_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_specialtylmModel)
});
