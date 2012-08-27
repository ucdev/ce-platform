/*! app/models/credit_request_email 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_email
*/
define("app/models/credit_request_email",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_request_emailModel = AppModel.extend({
		url: function() {
			base = "/api/credit_request_emails/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_request_emailModel)
});
