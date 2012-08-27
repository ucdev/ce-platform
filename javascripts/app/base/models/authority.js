/*! app/models/authority 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Authority
*/
define("app/models/authority",["require"],function(require) {
	var AppModel = require("app/model");
	var AuthorityModel = AppModel.extend({
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
