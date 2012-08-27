/*! app/models/person_client 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_client
*/
define("app/models/person_client",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_clientModel = AppModel.extend({
		url: function() {
			base = "/api/person_clients/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_clientModel)
});
