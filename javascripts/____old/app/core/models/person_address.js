/*! app/models/person_address 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_address
*/
define("app/models/Person_address",function(require,app) {
	app.models.Person_address = app.Model.extend({
			url: function() {
				base = "/api/person_addresses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
