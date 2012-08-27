/*! app/models/person_client 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_client
*/
define("app/models/person_client",["require","app"],function(require,app) {
	var Person_clientModel = app.Model.extend({
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
