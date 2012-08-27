/*! app/models/cert_credit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert_credit
*/
define("app/models/cert_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Cert_creditModel = AppModel.extend({
		url: function() {
			base = "/api/cert_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Cert_creditModel)
});
