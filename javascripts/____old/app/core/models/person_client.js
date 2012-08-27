/*! app/models/person_client 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_client
*/
define("app/models/Person_client",function(require,app) {
	app.models.Person_client = app.Model.extend({
			url: function() {
				base = "/api/person_clients/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
