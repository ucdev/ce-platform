/*! app/models/person_email 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_email
*/
define("app/models/person_email",["require","app"],function(require,app) {
	var Person_emailModel = app.Model.extend({
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
