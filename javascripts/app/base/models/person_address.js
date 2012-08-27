/*! app/models/person_address 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_address
*/
define("app/models/person_address",["require","app"],function(require,app) {
	var Person_addressModel = app.Model.extend({
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
