/*! app/models/person_interest_except 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_interest_except
*/
define("app/models/Person_interest_except",function(require,app) {
	app.models.Person_interest_except = app.Model.extend({
			url: function() {
				base = "/api/person_interest_excepts/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
