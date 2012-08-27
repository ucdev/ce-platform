/*! app/models/credit_request_email 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_email
*/
define("app/models/credit_request_email",["require","app"],function(require,app) {
	var Credit_request_emailModel = app.Model.extend({
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
