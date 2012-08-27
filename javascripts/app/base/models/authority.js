/*! app/models/authority 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Authority
*/
define("app/models/authority",["require","app"],function(require,app) {
	var AuthorityModel = app.Model.extend({
		url: function() {
			base = "/api/authorities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AuthorityModel)
});
