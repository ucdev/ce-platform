/*! app/models/person_interest_except 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_interest_except
*/
define("app/models/person_interest_except",["require","app"],function(require,app) {
	var Person_interest_exceptModel = app.Model.extend({
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
