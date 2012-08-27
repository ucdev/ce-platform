/*! app/models/cert 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Cert
*/
define("app/models/cert",["require","app"],function(require,app) {
	var CertModel = app.Model.extend({
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
