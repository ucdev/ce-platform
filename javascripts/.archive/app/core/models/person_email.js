/*! app/models/person_email 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_email
*/
define("app/models/Person_email",function(require,app) {
	app.models.Person_email = app.Model.extend({
			url: function() {
				base = "/api/person_emails/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
