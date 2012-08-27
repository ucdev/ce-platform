/*! app/models/person_email 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_email
*/
define("app/models/person_email",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_emailModel = AppModel.extend({
		url: function() {
			base = "/api/person_emails/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_emailModel)
});
