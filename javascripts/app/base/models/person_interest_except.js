/*! app/models/person_interest_except 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_interest_except
*/
define("app/models/person_interest_except",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_interest_exceptModel = AppModel.extend({
		url: function() {
			base = "/api/person_interest_excepts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_interest_exceptModel)
});
