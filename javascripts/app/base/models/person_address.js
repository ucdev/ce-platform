/*! app/models/person_address 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_address
*/
define("app/models/person_address",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_addressModel = AppModel.extend({
		url: function() {
			base = "/api/person_addresses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_addressModel)
});
