/*! app/models/credit_cert 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_cert
*/
define("app/models/credit_cert",["require","app"],function(require,app) {
	var Credit_certModel = app.Model.extend({
		url: function() {
			base = "/api/credit_certs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_certModel)
});
