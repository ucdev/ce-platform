/*! app/models/person_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_specialtylm
*/
define("app/models/person_specialtylm",["require","app"],function(require,app) {
	var Person_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/person_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_specialtylmModel)
});
