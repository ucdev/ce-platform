/*! app/models/certificate 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Certificate
*/
define("app/models/certificate",["require"],function(require) {
	var AppModel = require("app/model");
	var CertificateModel = AppModel.extend({
		url: function() {
			base = "/api/certificates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CertificateModel)
});
