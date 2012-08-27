/*! app/models/credit_cert 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_cert
*/
define("app/models/credit_cert",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_certModel = AppModel.extend({
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
