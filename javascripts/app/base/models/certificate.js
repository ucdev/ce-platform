/*! app/models/certificate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Certificate
*/
define("app/models/certificate",["require","app"],function(require,app) {
	var CertificateModel = app.Model.extend({
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
