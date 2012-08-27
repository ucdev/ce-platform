/*! app/models/cert 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert
*/
define("app/models/cert",["require"],function(require) {
	var AppModel = require("app/model");
	var CertModel = AppModel.extend({
		url: function() {
			base = "/api/certs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CertModel)
});
